From: Chao Xie <xiechao.mail@gmail.com>
Subject: cpufreq cowork with scheduler
Date: Fri, 15 Mar 2013 14:24:52 +0800
Message-ID: <CADApbegvhzBC-sawW++0fmxtEr6nCx6QWtSzPAikvo3CR6_8Bg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=Nu5bjbSOUb2Pk60D/KPk9+JEBk6CbMrcbAmM2c2KjTM=;
        b=AOrPbt7BgojykVJLojrJQUeSxzIw1JLFGRP5cNATvEhHDqBv8/IFLmcDptKAKHr7Mc
         +lEIohGpGDhKTp9wi40Y35t7Jj99m6QtbSoSsExfoN9EG3oE6sYq0TwdXnxKzYbI46ve
         nOBe/dQHgUeg6LbL8njaVme+0Fl8JlYEQ1oGpspTeC+gG2iZYByN6FwKhkgvAMtte39Q
         kD2QMG+h0lN2l9hqoPjjSjNHxthcqkGWbjbQxpnKp+Vvbk/lwPQSagwKh3Ok4gr6eavW
         JOVSIC5vlp3kPMKTzBuyFu3HD1p7VCZFhE2R2j+7SY49kSrKGWMirzkHfZekgYt5I5wn
         K7FA==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

hi
It may be a old topic.
Now the cpufreq governors will sample for system work load. The
schduler knows about the current workload of each cores. So why not
make use of it? The sampling need take some time, so when the cpufreq
increase the frequency , the system has been busy for a period of
time. Making use of the schduler information can reduce time spending
at sampling.
