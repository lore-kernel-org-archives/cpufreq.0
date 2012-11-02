From: Chao Xie <xiechao.mail@gmail.com>
Subject: cpufreq exclusive with cpu hotplug
Date: Fri, 2 Nov 2012 10:56:07 +0800
Message-ID: <CADApbejeLyEo6+JWcZVpgxavqRpnB_8ZNi=Nweki=DiUJVrWHA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=qlGoczQWgeh/tfUIwPLFglrzP44jQwpRkTsO0Duj3yI=;
        b=rucqhjMiX+sDDVqGI3P+RO3AE2lXdG0NohNi9fxvYPXWpjhvJKpo/vkiLyo9ZsLGJX
         ycO5AE72SOq8Ob8FZKz+eCL3c3Uf2ygHYAffb1OpzU3N121BEAofoYc8dsKnVqA1rozm
         O95tJEZmJ/E85mkp7e27/DJ1gdFHihxGmNOOAi4j97h62U19tJufrt1OlhxhqxcCrfy9
         PN5sXYpw28QV8a3jd0WjZhiCdCIabWcpW1bcN0H/+pfqepGtfzEumr2MU5XsGtzxGG8j
         cTCLIWnxB73Hc76hoUjLWuJNb/b27bh8ah/jv9iQ5oO3mVjZclcflVFoWDmrERo6pyW0
         icDg==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

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
