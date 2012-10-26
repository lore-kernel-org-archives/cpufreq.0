From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH] cpufreq: Avoid calling cpufreq driver's target() routine if target_freq == policy->cur
Date: Fri, 26 Oct 2012 15:06:26 +0530
Message-ID: <1d7b6e421a335255da956804b43ce3517538409c.1351244153.git.viresh.kumar@linaro.org>
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: rjw@sisk.pl
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-dev@lists.linaro.org, patches@linaro.org, pdsw-power-team@arm.com, Viresh Kumar <viresh.kumar@linaro.org>

Avoid calling cpufreq driver's target() routine if new frequency is same as
policies current frequency.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 261ef65..28dc134 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1476,6 +1476,10 @@ int __cpufreq_driver_target(struct cpufreq_policy *p=
olicy,
=20
 =09pr_debug("target for CPU %u: %u kHz, relation %u\n", policy->cpu,
 =09=09target_freq, relation);
+
+=09if (target_freq =3D=3D policy->cur)
+=09=09return 0;
+
 =09if (cpu_online(policy->cpu) && cpufreq_driver->target)
 =09=09retval =3D cpufreq_driver->target(policy, target_freq, relation);
=20
--=20
1.7.12.rc2.18.g61b472e


