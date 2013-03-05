From: dirk.brandewie@gmail.com
Subject: [PATCH 0/2] v3.9-rc1 fixes for intel_pstate driver
Date: Tue,  5 Mar 2013 14:15:25 -0800
Message-ID: <1362521727-20666-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer;
        bh=QsYjrU3GtJIWaOG/XwjwWXP+4D2WqJE9BwnyOr2BhBk=;
        b=jmf5SysfGs6GOMA9nLu557AWIj269brz6x3BeWNDYU/k/rnBxG/dXccNO1H+49lWDz
         RNBs1BLVA7AEFwuNQxSW59Kr4gz12FFpNBk8cj0QbHaw/wR3o9Gd2oV6l380sAhYt3QH
         6B8EIvi8JwfYSJhTxDFK/u3nZDEFxxnEk4HWrNBO1KVuEvuKubN/lp/2Gp8HGmM8eO0F
         nbOpI081n5op1OCqW3+PjdsBA9TWCHDTutOLs5nyNUat4lp0pGKDRmdqrW48GnZcOVt4
         iSvcB0XPsah1OLinoa9M5sojvrNTmzxUmS2REryTDZKYu7zGhTuEaJAyeXvDvasCJmoZ
         Vw4A==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: konrad.wilk@oracle.com, jwboyer@redhat.com, Dirk Brandewie <dirk.brandewie@gmail.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

These patches fix the issues reported against the intel_pstate driver.

The first bug reported by Josh Boyer was that the dirver would blow up
when loading in a VM exposed the second bug that the error path in
intel_pstate_init() was incorrect and biting Konrad Wilk as well.

https://bugzilla.redhat.com/show_bug.cgi?id=916833
https://lkml.org/lkml/2013/3/5/394

Dirk Brandewie (2):
  cpufreq/intel_pstate: Do not load on VM that do not report max P
    state.
  cpufreq/intel_pstate: Fix intel_pstate_init() error path

 drivers/cpufreq/intel_pstate.c |   42 +++++++++++++--------------------------
 1 files changed, 14 insertions(+), 28 deletions(-)

-- 
1.7.7.6

