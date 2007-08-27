1.20
========================================================================
	Realtime Preview plugin for MovableType w/ BigPAPI
			Original Copyright (c) 2006 Piroli YUKARINOMIYA
			Open MagicVox.net - http://www.magicvox.net/
			@see http://www.magicvox.net/archive/2006/02071650.php
========================================================================

■ 動作環境
	MovableType 3.2ja2 以上、あるいは MovableType 3.16 以上
	別途、BigPAPI 1.04 以上が正しく導入されていること
	perl 5.0x 以降、perl 5.8 以上を推奨


■ 導入方法

1. パッケージに含まれるファイルを MovableType の plugins にコピーします

	note:	/path/to/your/home/movabletype/plugins/RealtimePreview/RealtimePreview.pl

2. メニューから Realtime Preview プラグインが追加されていることを確認します

3. 個別アーカイブテンプレートを修正し、プレビュー対象にしたいタグを書き換えます

	書換え前の例：
		a. <$MTEntryBody$>
		b. <$MTEntryMore$>

	書換え後の例：
		a. <MTRealtimePreview field="text"><$MTEntryBody$></MTRealtimePreview>
		b. <MTRealtimePreview field="text_more"><$MTEntryBody$></MTRealtimePreview>

	note:	"詳細は追加されたタグ"節の <MTRealtimePreview> を参照してください

4.個別アーカイブ(エントリアーカイブ)を再構築します


■ 使い方
	エントリの編集画面に新しく Realtime Preview ボタンが追加されています。
	このボタンを押すと、プレビューのために新しくプレビューウィンドゥが開きます。
	プレビューウィンドゥには現在編集中の記事か、または編集中の記事が"下書き"の場合であれば
	最も最近に公開された記事が表示されています。
	この状態でエントリの編集画面でテキストエリアの内容を変更すると、
	その変更内容がプレビューウィンドゥに即時に反映されます。

	note:	記事を保存した時は、再度 Realtime Preview ボタンを押してください。
	note:	ブログに公開されている記事が一つも無い場合、プラグインは動作しません。


■ 追加されるテンプレートタグ

<MTRealtimePreviewID> タグ
	MovableType の編集画面で入力された内容が、リアルタイムに反映される領域のための
	ユニークな ID 文字列を返します。
	後述の MTRealtimePreview コンテナタグを使う方が簡単な場合があります。
	後述の field 属性が必須です。

	例：<div id="<$MTRealtimePreviewID field="title"$>"><$MTEntryTitle$></div>

<MTRealtimePreview> コンテナタグ
	MovableType の編集画面で入力された内容が、リアルタイムに反映される領域を指定します。
	具体的には、このタグに含まれる領域が <span id="..."> と </span> で括られる*だけ*です。
	後述の field 属性が必須です。

	例：<MTRealtimePreview field="title"><$MTEntryTitle$></MTRealtimePreview>

field 属性
	リアルタイムプレビューで流し込まれるデータを指定します。
	MovableType のテンプレートタグに対応する field 値は以下の通りです。

	MTEntryXXX          field="..."
	-------------------------------
	MTEntryTitle        title
	MTEntryBody         text
	MTEntryMore         text_more
	MTEntryKeywords     keywords
	MTEntryExcerpt      excerpt

note:	MTRealtimePreview、MTRealtimePreviewID は何度でも使えます。

note:	MTRealtimePreview をネストすることはできません。

note:	MTRealtimePreview はプレビューのための <span> エレメントを生成しますが、
		これが問題になる場合は MTRealtimePreviewID で回避してください。


■ 使用許諾条件
	このソフトウェアパッケージの内容については完全に無保証です。
	このソフトウェアパッケージの配布や改変に関する条件は
	The Artistic License (http://www.opensource.jp/artistic/ja/Artistic-ja.html)
	に準じるものとし、これに従う限り自由にすることができます。
		This code is released under the Artistic License.
		The terms of the Artistic License are described at
		http://www.perl.com/language/misc/Artistic.html


■ 謝辞
	(有)IT プロフェッショナル(http://www.it-pro.co.jp/)の Dakiny さんに
	動作確認のための MovableType 3.2ja2 環境を提供して頂きました。
	この場を借りてお礼申し上げます。

	Realtime Preview プラグインの作成にあたっては次のページを参考にさせて頂きました。
		BigPAPI (c)Kevin Shay
			http://www.staggernation.com/mtplugins/BigPAPI/
		RightFields (c)Kevin Shayを参考にさせて頂きました。
			http://www.staggernation.com/mtplugins/RightFields/
		[ajax]quickedit - HTMLリアルタイム編集（ブックマークレット）
			http://zerobase.jp/blog/entry-275.html


■ 雑記
	このプラグインと同じ機能を持つブックマークレット版もあります ;)
		MovableTypeで編集中の記事をリアルタイムにプレビューする
			http://www.magicvox.net/archive/2006/01052336.php


■ 更新履歴
1.20    '06/06/14   改行設定(改行を変換する)の動作をMTのそれに準拠
                    (very thanks to 山川さん＠SKYARC System)

1.10    '06/03/04   編集画面の改行設定(改行を変換する)に対応した
                    IE でプレビューウィンドゥを閉じた時の警告メッセージに対応
                    (very thanks to 山川さん＠SKYARC System)

1.00    '06/02/07   初版公開
