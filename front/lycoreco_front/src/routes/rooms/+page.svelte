<script>
	function onclick() {
		window.location.href = '/rooms';
	}
</script>


<main>
    <ion-header>
        <ion-button {onclick} size="small" class="back_button" fill="clear">←</ion-button>
    </ion-header>
    <center>
        <h1>ルームリスト</h1>
    </center>
        <ion-card>
            <ion-card-header>
                <ion-card-title>ルーム1</ion-card-title>
            </ion-card-header>
        </ion-card>
        <ion-card>
            <ion-card-header>
                <ion-card-title>ルーム2</ion-card-title>
            </ion-card-header>
        </ion-card>
        <ion-card>
            <ion-card-header>
                <ion-card-title>ルーム3</ion-card-title>
            </ion-card-header>
        </ion-card>
        <ion-card>
            <ion-card-header>
                <ion-card-title>ルーム4</ion-card-title>
            </ion-card-header>
        </ion-card>
        <ion-card>
            <ion-card-header>
                <ion-card-title>ルーム5</ion-card-title>
            </ion-card-header>
        </ion-card>
    <center>
        <ion-button shape="round">
            ＋
        </ion-button>
    </center>
</main>
<style>
    ion-botton{
        text-align: center;
        position: absolute;
    }
</style>