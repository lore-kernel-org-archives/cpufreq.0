From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH] cpufreq:core: Fix printing of governor and driver name
Date: Wed, 10 Oct 2012 10:12:11 +0530
Message-ID: <51be8f865e4c80f91ac8e41e54cbd5905382ddb7.1349844049.git.viresh.kumar@linaro.org>
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: rjw@sisk.pl
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org, Sudeep.KarkadaNagesha@arm.com, Robin.Randhawa@arm.com, Arvind.Chauhan@arm.com, Viresh Kumar <viresh.kumar@linaro.org>

Arrays for governer and driver name are of size CPUFREQ_NAME_LEN or 16.
i.e. 15 bytes for name and 1 for trailing '\0'.

When cpufreq driver print these names (for sysfs), it includes '\n' or ' ' =
in
the fmt string and still passes length as CPUFREQ_NAME_LEN. If the driver o=
r
governor names are using all 15 fields allocated to them, then the trailing=
 '\n'
or ' ' will never be printed. And so commands like:

root@linaro-developer# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_dri=
ver

will print something like:

cpufreq_foodrvroot@linaro-developer#

Fix this by increasing print length by one character.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq.c | 6 +++---
 include/linux/cpufreq.h   | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 021973b..db6e337 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -445,7 +445,7 @@ static ssize_t show_scaling_governor(struct cpufreq_pol=
icy *policy, char *buf)
 =09else if (policy->policy =3D=3D CPUFREQ_POLICY_PERFORMANCE)
 =09=09return sprintf(buf, "performance\n");
 =09else if (policy->governor)
-=09=09return scnprintf(buf, CPUFREQ_NAME_LEN, "%s\n",
+=09=09return scnprintf(buf, CPUFREQ_NAME_PLEN, "%s\n",
 =09=09=09=09policy->governor->name);
 =09return -EINVAL;
 }
@@ -491,7 +491,7 @@ static ssize_t store_scaling_governor(struct cpufreq_po=
licy *policy,
  */
 static ssize_t show_scaling_driver(struct cpufreq_policy *policy, char *bu=
f)
 {
-=09return scnprintf(buf, CPUFREQ_NAME_LEN, "%s\n", cpufreq_driver->name);
+=09return scnprintf(buf, CPUFREQ_NAME_PLEN, "%s\n", cpufreq_driver->name);
 }
=20
 /**
@@ -512,7 +512,7 @@ static ssize_t show_scaling_available_governors(struct =
cpufreq_policy *policy,
 =09=09if (i >=3D (ssize_t) ((PAGE_SIZE / sizeof(char))
 =09=09    - (CPUFREQ_NAME_LEN + 2)))
 =09=09=09goto out;
-=09=09i +=3D scnprintf(&buf[i], CPUFREQ_NAME_LEN, "%s ", t->name);
+=09=09i +=3D scnprintf(&buf[i], CPUFREQ_NAME_PLEN, "%s ", t->name);
 =09}
 out:
 =09i +=3D sprintf(&buf[i], "\n");
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index b60f6ba..fc4b785 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -22,6 +22,8 @@
 #include <asm/div64.h>
=20
 #define CPUFREQ_NAME_LEN 16
+/* Print length for names. Extra 1 space for accomodating '\n' in prints *=
/
+#define CPUFREQ_NAME_PLEN (CPUFREQ_NAME_LEN + 1)
=20
=20
 /*********************************************************************
--=20
1.7.12.rc2.18.g61b472e


