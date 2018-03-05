import base64
import json
import os
import pytest

import tayberry

@pytest.fixture
def client():
    tayberry.app.testing = True
    return tayberry.app.test_client()

def test_index(client):
    r = client.get('/')
    assert r.status_code == 200
