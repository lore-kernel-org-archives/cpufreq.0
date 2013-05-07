From: dirk.brandewie@gmail.com
Subject: [PATCH 0/6] Intel pstate driver update
Date: Tue,  7 May 2013 08:20:24 -0700
Message-ID: <1367940030-19311-1-git-send-email-dirk.j.brandewie@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer;
        bh=9yX0SZz1BxMhewUuRerYzpQl2YWU1wFMhXvo9e2O7jA=;
        b=XqjKI1/8o7hbay4Xps4LOAhSxh7cAmlqdh0wpD75MsxtFNvzxVwPlAiWTugEG7BPqh
         510gG5lpur5TSxjHOyzy8Gtxn+THPHJ0hQrvcSDo7vHIRRRdRlY2ALhZGjH1iUcwvqZj
         fh+L6qg1RSJePqNH22XuDhgZuwqF7uTDc7p5H1izC40lsf+V/rSIfoyU704tkTC/9TF1
         JHHCYZXSW367/Xa10cO7DsTcyYH1/lEunhfGYjvjxARZ/yn5Jr/suJWKg6xCy5t17r9g
         OzWXLBbhr0CTXI31y9mhhCWvecFtHlDzm++KOH7E7rKZnk+NTCgnlI7ACIJ3JKFPJShM
         wL0A==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: dirk <dirk.brandewie@gmail.com>

From: dirk <dirk.brandewie@gmail.com>

Collection of updates for cpufreq/intel_pstate.c

Patches 1-3 are bugfixes and marked for stable

Patches 4-6 are code cleanup with no functional changes.


Dirk Brandewie (6):
  cpufreq/intel_pstate: remove idle time and duration from sample and
    calculations
  cpufreq/intel_pstate: use lowest requested max performance
  cpufreq/intel_pstate: fix ffmpeg regression
  cpufreq/intel_pstate: Remove idle mode PID
  cpufreq/intel_pstate: Remove unused code
  cpufreq/intel_pstate: remove #ifdef MODULE compile fence

 drivers/cpufreq/intel_pstate.c | 122 +++++++----------------------------------
 1 file changed, 20 insertions(+), 102 deletions(-)

-- 
1.7.11.7

