From: Chao Xie <xiechao.mail@gmail.com>
Subject: cpufreq exclusive with cpu hotplug
Date: Wed, 7 Nov 2012 10:11:57 +0800
Message-ID: <CADApbehLCwWv59MAjRv9EqGiJNbwRUMGea2oYMyOxJrKRV39Cg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=qlGoczQWgeh/tfUIwPLFglrzP44jQwpRkTsO0Duj3yI=;
        b=DZRJMUr0tRsdUgzSfhI846yhYzJ8w9z22/qgCpu98JVsPc6GHicRntL/wogXU0+Mxm
         GhG5w61JAc8IzPY2Xmc41Pjvpp7mLvh8shyRdOF/YWJ2xrF3+laPfYJqlH7m0Kk95/Pd
         wSh4tBWDNw62K8akgTEoyGwjnAtB7H2/k6FRecEn/5R+b+jr9IEs+g8k5NzpVtfwjuTP
         6VpjOtMCx4EI0dMzGMZPEK4455VpkyNeU+KIcZg7oqrJd1HbKc+CFypIeNUEZfi4maTG
         PpgdX/083NtqnRqzHOapBnTeuGLVhvt2z241X4t3IniSFot1saW0Oayhar3fFsz4m/EB
         yW2g==
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
