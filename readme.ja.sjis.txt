1.20
========================================================================
	Realtime Preview plugin for MovableType w/ BigPAPI
			Original Copyright (c) 2006 Piroli YUKARINOMIYA
			Open MagicVox.net - http://www.magicvox.net/
			@see http://www.magicvox.net/archive/2006/02071650.php
========================================================================

�� �����
	MovableType 3.2ja2 �ȏ�A���邢�� MovableType 3.16 �ȏ�
	�ʓr�ABigPAPI 1.04 �ȏオ��������������Ă��邱��
	perl 5.0x �ȍ~�Aperl 5.8 �ȏ�𐄏�


�� �������@

1. �p�b�P�[�W�Ɋ܂܂��t�@�C���� MovableType �� plugins �ɃR�s�[���܂�

	note:	/path/to/your/home/movabletype/plugins/RealtimePreview/RealtimePreview.pl

2. ���j���[���� Realtime Preview �v���O�C�����ǉ�����Ă��邱�Ƃ��m�F���܂�

3. �ʃA�[�J�C�u�e���v���[�g���C�����A�v���r���[�Ώۂɂ������^�O�����������܂�

	�������O�̗�F
		a. <$MTEntryBody$>
		b. <$MTEntryMore$>

	��������̗�F
		a. <MTRealtimePreview field="text"><$MTEntryBody$></MTRealtimePreview>
		b. <MTRealtimePreview field="text_more"><$MTEntryBody$></MTRealtimePreview>

	note:	"�ڍׂ͒ǉ����ꂽ�^�O"�߂� <MTRealtimePreview> ���Q�Ƃ��Ă�������

4.�ʃA�[�J�C�u(�G���g���A�[�J�C�u)���č\�z���܂�


�� �g����
	�G���g���̕ҏW��ʂɐV���� Realtime Preview �{�^�����ǉ�����Ă��܂��B
	���̃{�^���������ƁA�v���r���[�̂��߂ɐV�����v���r���[�E�B���h�D���J���܂��B
	�v���r���[�E�B���h�D�ɂ͌��ݕҏW���̋L�����A�܂��͕ҏW���̋L����"������"�̏ꍇ�ł����
	�ł��ŋ߂Ɍ��J���ꂽ�L�����\������Ă��܂��B
	���̏�ԂŃG���g���̕ҏW��ʂŃe�L�X�g�G���A�̓��e��ύX����ƁA
	���̕ύX���e���v���r���[�E�B���h�D�ɑ����ɔ��f����܂��B

	note:	�L����ۑ��������́A�ēx Realtime Preview �{�^���������Ă��������B
	note:	�u���O�Ɍ��J����Ă���L������������ꍇ�A�v���O�C���͓��삵�܂���B


�� �ǉ������e���v���[�g�^�O

<MTRealtimePreviewID> �^�O
	MovableType �̕ҏW��ʂœ��͂��ꂽ���e���A���A���^�C���ɔ��f�����̈�̂��߂�
	���j�[�N�� ID �������Ԃ��܂��B
	��q�� MTRealtimePreview �R���e�i�^�O���g�������ȒP�ȏꍇ������܂��B
	��q�� field �������K�{�ł��B

	��F<div id="<$MTRealtimePreviewID field="title"$>"><$MTEntryTitle$></div>

<MTRealtimePreview> �R���e�i�^�O
	MovableType �̕ҏW��ʂœ��͂��ꂽ���e���A���A���^�C���ɔ��f�����̈���w�肵�܂��B
	��̓I�ɂ́A���̃^�O�Ɋ܂܂��̈悪 <span id="..."> �� </span> �Ŋ�����*����*�ł��B
	��q�� field �������K�{�ł��B

	��F<MTRealtimePreview field="title"><$MTEntryTitle$></MTRealtimePreview>

field ����
	���A���^�C���v���r���[�ŗ������܂��f�[�^���w�肵�܂��B
	MovableType �̃e���v���[�g�^�O�ɑΉ����� field �l�͈ȉ��̒ʂ�ł��B

	MTEntryXXX          field="..."
	-------------------------------
	MTEntryTitle        title
	MTEntryBody         text
	MTEntryMore         text_more
	MTEntryKeywords     keywords
	MTEntryExcerpt      excerpt

note:	MTRealtimePreview�AMTRealtimePreviewID �͉��x�ł��g���܂��B

note:	MTRealtimePreview ���l�X�g���邱�Ƃ͂ł��܂���B

note:	MTRealtimePreview �̓v���r���[�̂��߂� <span> �G�������g�𐶐����܂����A
		���ꂪ���ɂȂ�ꍇ�� MTRealtimePreviewID �ŉ�����Ă��������B


�� �g�p��������
	���̃\�t�g�E�F�A�p�b�P�[�W�̓��e�ɂ��Ă͊��S�ɖ��ۏ؂ł��B
	���̃\�t�g�E�F�A�p�b�P�[�W�̔z�z����ςɊւ��������
	The Artistic License (http://www.opensource.jp/artistic/ja/Artistic-ja.html)
	�ɏ�������̂Ƃ��A����ɏ]�����莩�R�ɂ��邱�Ƃ��ł��܂��B
		This code is released under the Artistic License.
		The terms of the Artistic License are described at
		http://www.perl.com/language/misc/Artistic.html


�� �ӎ�
	(�L)IT �v���t�F�b�V���i��(http://www.it-pro.co.jp/)�� Dakiny �����
	����m�F�̂��߂� MovableType 3.2ja2 ����񋟂��Ē����܂����B
	���̏���؂�Ă���\���グ�܂��B

	Realtime Preview �v���O�C���̍쐬�ɂ������Ă͎��̃y�[�W���Q�l�ɂ����Ē����܂����B
		BigPAPI (c)Kevin Shay
			http://www.staggernation.com/mtplugins/BigPAPI/
		RightFields (c)Kevin Shay���Q�l�ɂ����Ē����܂����B
			http://www.staggernation.com/mtplugins/RightFields/
		[ajax]quickedit - HTML���A���^�C���ҏW�i�u�b�N�}�[�N���b�g�j
			http://zerobase.jp/blog/entry-275.html


�� �G�L
	���̃v���O�C���Ɠ����@�\�����u�b�N�}�[�N���b�g�ł�����܂� ;)
		MovableType�ŕҏW���̋L�������A���^�C���Ƀv���r���[����
			http://www.magicvox.net/archive/2006/01052336.php


�� �X�V����
1.20    '06/06/14   ���s�ݒ�(���s��ϊ�����)�̓����MT�̂���ɏ���
                    (very thanks to �R�삳��SKYARC System)

1.10    '06/03/04   �ҏW��ʂ̉��s�ݒ�(���s��ϊ�����)�ɑΉ�����
                    IE �Ńv���r���[�E�B���h�D��������̌x�����b�Z�[�W�ɑΉ�
                    (very thanks to �R�삳��SKYARC System)

1.00    '06/02/07   ���Ō��J
