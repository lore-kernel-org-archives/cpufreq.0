From: Chao Xie <xiechao.mail@gmail.com>
Subject: cpufreq@vger.kernel.org
Date: Thu, 1 Nov 2012 12:06:20 +0800
Message-ID: <CADApbegj_6hvgY3sBF2+ov=iOQ05vPtbS9fyxrZu_YKUOKwxUA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:cc:content-type;
        bh=qlGoczQWgeh/tfUIwPLFglrzP44jQwpRkTsO0Duj3yI=;
        b=MrGxQ9aUtWw7o4ezmDTyDmLHqjaoN22nW2xqXc0VqwfoyOqtb7BqroRwIxX8btY5aB
         dtcA1COrqfhumwPNQzSowroAPnSCcYYrzYp2OAuigf0P83EH7jNmT5WfdRRyXdhry+gZ
         YCl9vDNdRR1w8AcJ9II4cB5NjZwmqldumkU5AmbgeRC5AHpGMw7oxdZxWznCuDvM4Iyu
         6xpccMvqTuymraiVKH3Y4bwRBsWw7yHzYiMYUoymno4jwGl95CVUv2XU7rQ3CuCs0ZfS
         zxE4nZSXnqoJt0cjRTB5TJwiHvSCLllS5GK4GMjrC+HWLTFcp1U1x2/B3IP8JYjj9e3e
         UjYg==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: cxie4@marvell.com

Hi
As I understand that when cpufreq work with cpu hotplug together, it
depends on policy_lock to make sure that cpufreq will not work with
cpu hotplug together. They can be ordered.
The userspace governor use __cpufreq_driver_target not
cpufreq_driver_target when change the cpu frequency. It means that it
will not grap the policy_lock, so when change the cpu frequency, the
cpu hotplug will happen.
So what I need to do if I want to make cpu hotplug not happens at same
time when I change the cpu frequency?
