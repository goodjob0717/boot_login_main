	function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('preview').src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById('preview').src = "";
  }
}

//이미지 업로드 파일 삭제 기능
function clearPreview() {
    // 이미지 미리보기 영역을 비웁니다.
    document.getElementById('preview').src = '';
}

//학력 dropdown 기능
function showTable(value) {
    var highschoolTable = document.getElementById('highschool');
    var universityTable = document.getElementById('university');

    if (value === '고등학교') {
        highschoolTable.classList.remove('hidden');
        universityTable.classList.add('hidden');
    } else if (value === '대학교') {
        highschoolTable.classList.add('hidden');
        universityTable.classList.remove('hidden');
    }
}

window.onload = function() {
    showTable(document.getElementById('dropdown').value);
}


document.querySelectorAll('.auto-resize').forEach(function(textarea) {
textarea.addEventListener('input', function() {
    this.style.height = 'auto';
    this.style.height = this.scrollHeight + 'px';
	});
});

function addItem(event) {
  event.preventDefault(); // 기본 동작 막기
  const selectedSkill = document.getElementById('skills').value;
  const itemList = document.getElementById('itemList');
  const hiddenInputs = document.getElementById('hiddenInputs');

  if (Array.from(itemList.children).some(item => item.textContent.includes(selectedSkill))) {
    alert('이미 추가된 스킬입니다.');
    return;
  }

  const newItem = document.createElement('div');
  newItem.classList.add('item');

  const skillText = document.createElement('span');
  skillText.textContent = selectedSkill;
  newItem.appendChild(skillText);

  const deleteButton = document.createElement('button');
  deleteButton.textContent = '삭제';
  deleteButton.onclick = function() {
    itemList.removeChild(newItem);
    hiddenInputs.removeChild(hiddenInput);
  };
  newItem.appendChild(deleteButton);

  itemList.appendChild(newItem);

  const hiddenInput = document.createElement('input');
  hiddenInput.type = 'hidden';
  hiddenInput.name = 'skills[]';
  hiddenInput.value = selectedSkill;
  hiddenInputs.appendChild(hiddenInput);
}

function handleSubmit() {
  var skillList = [];
  $('#itemList .item').each(function() {
    skillList.push($(this).text());
  });
  $('#hiddenInputs').html('');
  skillList.forEach(function(skill) {
    $('#hiddenInputs').append('<input type="hidden" name="skills" value="' + skill + '">');
  });
  return true;
}