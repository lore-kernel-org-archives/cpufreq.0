From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 0/4] CPUFreq Fixes for 3.9
Date: Thu,  7 Feb 2013 15:57:42 +0530
Message-ID: <cover.1360232293.git.viresh.kumar@linaro.org>
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: rjw@sisk.pl, valdis.kletnieks@vt.edu, artem.savkov@gmail.com
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, Viresh Kumar <viresh.kumar@linaro.org>

Hi Rafael,

This is another unplanned patchset for all the platforms that i broke. :)

Okay, there are two important fixes (1 & 4) and two general cleanups (2 & 3=
). I
hope most of the issues would be resolved by these and we would be able to =
push
clean cpufreq core into 3.9.

I have pushed them in my for-rafael branch at:

http://git.linaro.org/gitweb?p=3Dpeople/vireshk/linux.git;a=3Dshortlog;h=3D=
refs/heads/for-rafael

@Artem & Valdis: Please test them and reply with your Tested-by's (in case =
they
work :) ).

Viresh Kumar (4):
  cpufreq: governors: Fix WARN_ON() for multi-policy platforms
  cpufreq: Remove unused HOTPLUG_CPU code
  cpufreq: Create a macro for unlock_policy_rwsem{read,write}
  cpufreq: Fix locking issues

 drivers/cpufreq/cpufreq.c          | 126 ++++++++++++++++++---------------=
----
 drivers/cpufreq/cpufreq_governor.c |  32 ++++++----
 2 files changed, 79 insertions(+), 79 deletions(-)

--=20
1.7.12.rc2.18.g61b472e


