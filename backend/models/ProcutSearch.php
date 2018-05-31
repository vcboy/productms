<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Procut;

/**
 * ProcutSearch represents the model behind the search form about `backend\models\Procut`.
 */
class ProcutSearch extends Procut
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'booker_id', 'book_date', 'book_comment', 'arrive_date', 'is_customer', 'sender_id', 'send_date', 'send_status', 'inspector_id', 'inspect_date', 'inspect_status', 'is_del'], 'integer'],
            [['total_price'], 'number'],
            [['send_comment', 'inspect_comment', 'customer'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Procut::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'booker_id' => $this->booker_id,
            'book_date' => $this->book_date,
            'book_comment' => $this->book_comment,
            'arrive_date' => $this->arrive_date,
            'is_customer' => $this->is_customer,
            'total_price' => $this->total_price,
            'sender_id' => $this->sender_id,
            'send_date' => $this->send_date,
            'send_status' => $this->send_status,
            'inspector_id' => $this->inspector_id,
            'inspect_date' => $this->inspect_date,
            'inspect_status' => $this->inspect_status,
            'is_del' => $this->is_del,
        ]);

        $query->andFilterWhere(['like', 'send_comment', $this->send_comment])
            ->andFilterWhere(['like', 'inspect_comment', $this->inspect_comment])
            ->andFilterWhere(['like', 'customer', $this->customer]);

        return $dataProvider;
    }
}