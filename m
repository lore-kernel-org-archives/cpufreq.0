From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Sun, 24 Mar 2013 00:05:08 +0530
Message-ID: <CAKohponXRvWg=qj6hBeZkzCXx4rfmWm+4xoJZS_b7gzg-Ri7OA@mail.gmail.com>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
	<20130319074953.C200811FB80@bugzilla.kernel.org>
	<CAKohpo=dRuE0bUHTNnq14d6G3ZEcnwPw4Amk5YpXFUVpekrxTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=e89a8ff1c2d8d4039104d89bd4cf
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpo=dRuE0bUHTNnq14d6G3ZEcnwPw4Amk5YpXFUVpekrxTQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: 1i5t5.duncan@cox.net
Cc: bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Thomas Renninger <trenn@suse.de>

--e89a8ff1c2d8d4039104d89bd4cf
Content-Type: text/plain; charset=ISO-8859-1

On 19 March 2013 14:20, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> We are talking here about a bug reported by Duncan here. His cpu/cpu*/cpufreq
> directory are getting corrupted with 3.9-rc3 and was working well with 3.8

Hi Duncan,

My weekend is already spoiled (due to my bugs :) ) and i don't want to spoil
yours. But this is a important patch to test, can you please give it a
try as soon
as you can? And confirm if this resolves your issues or not? (patch is attached
too)

------------x------------------x------------------

From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Sat, 23 Mar 2013 23:42:44 +0530
Subject: [PATCH] cpufreq: acpi-cpufreq: Set policy->cpus correctly from .init()

With the addition of following patch:

fcf8058 cpufreq: Simplify cpufreq_add_dev()

cpufreq driver's .init() routine must initialize policy->cpus with mask of all
possible cpus (Online + Offline) that share the clock. Then the core would copy
this mask onto policy->related_cpus and will reset policy->cpus to carry only
online cpus.

acpi-cpufreq driver wasn't updated with this assumption and so sometimes when
we try to hot[un]plug cpus at run time, sysfs directories gets corrupted.

This patch fixes acpi-cpufreq driver against this corruption.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/acpi-cpufreq.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
index 937bc28..ceb5925 100644
--- a/drivers/cpufreq/acpi-cpufreq.c
+++ b/drivers/cpufreq/acpi-cpufreq.c
@@ -722,15 +722,7 @@ static int acpi_cpufreq_cpu_init(struct
cpufreq_policy *policy)
 	perf = data->acpi_data;
 	policy->shared_type = perf->shared_type;

-	/*
-	 * Will let policy->cpus know about dependency only when software
-	 * coordination is required.
-	 */
-	if (policy->shared_type == CPUFREQ_SHARED_TYPE_ALL ||
-	    policy->shared_type == CPUFREQ_SHARED_TYPE_ANY) {
-		cpumask_copy(policy->cpus, perf->shared_cpu_map);
-	}
-	cpumask_copy(policy->related_cpus, perf->shared_cpu_map);
+	cpumask_copy(policy->cpus, perf->shared_cpu_map);

 #ifdef CONFIG_SMP
 	dmi_check_system(sw_any_bug_dmi_table);
@@ -740,9 +732,7 @@ static int acpi_cpufreq_cpu_init(struct
cpufreq_policy *policy)
 	}

 	if (check_amd_hwpstate_cpu(cpu) && !acpi_pstate_strict) {
-		cpumask_clear(policy->cpus);
-		cpumask_set_cpu(cpu, policy->cpus);
-		cpumask_copy(policy->related_cpus, cpu_sibling_mask(cpu));
+		cpumask_copy(policy->cpus, cpu_sibling_mask(cpu));
 		policy->shared_type = CPUFREQ_SHARED_TYPE_HW;
 		pr_info_once(PFX "overriding BIOS provided _PSD data\n");
 	}


--
viresh

--e89a8ff1c2d8d4039104d89bd4cf
Content-Type: application/octet-stream; 
	name="0001-cpufreq-acpi-cpufreq-Set-policy-cpus-correctly-from-.patch"
Content-Disposition: attachment; 
	filename="0001-cpufreq-acpi-cpufreq-Set-policy-cpus-correctly-from-.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hen3twuf0

RnJvbSA0ZmIwM2RkNTk5NjVkOGZhMDExZGY0OTM1ODYzMmY5NWFlZjFmYTc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpNZXNzYWdlLUlkOiA8NGZiMDNkZDU5OTY1ZDhmYTAxMWRmNDkzNTg2MzJm
OTVhZWYxZmE3NC4xMzY0MDYyNjA3LmdpdC52aXJlc2gua3VtYXJAbGluYXJvLm9yZz4KRnJvbTog
VmlyZXNoIEt1bWFyIDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4KRGF0ZTogU2F0LCAyMyBNYXIg
MjAxMyAyMzo0Mjo0NCArMDUzMApTdWJqZWN0OiBbUEFUQ0hdIGNwdWZyZXE6IGFjcGktY3B1ZnJl
cTogU2V0IHBvbGljeS0+Y3B1cyBjb3JyZWN0bHkgZnJvbQogLmluaXQoKQoKV2l0aCB0aGUgYWRk
aXRpb24gb2YgZm9sbG93aW5nIHBhdGNoOgoKZmNmODA1OCBjcHVmcmVxOiBTaW1wbGlmeSBjcHVm
cmVxX2FkZF9kZXYoKQoKY3B1ZnJlcSBkcml2ZXIncyAuaW5pdCgpIHJvdXRpbmUgbXVzdCBpbml0
aWFsaXplIHBvbGljeS0+Y3B1cyB3aXRoIG1hc2sgb2YgYWxsCnBvc3NpYmxlIGNwdXMgKE9ubGlu
ZSArIE9mZmxpbmUpIHRoYXQgc2hhcmUgdGhlIGNsb2NrLiBUaGVuIHRoZSBjb3JlIHdvdWxkIGNv
cHkKdGhpcyBtYXNrIG9udG8gcG9saWN5LT5yZWxhdGVkX2NwdXMgYW5kIHdpbGwgcmVzZXQgcG9s
aWN5LT5jcHVzIHRvIGNhcnJ5IG9ubHkKb25saW5lIGNwdXMuCgphY3BpLWNwdWZyZXEgZHJpdmVy
IHdhc24ndCB1cGRhdGVkIHdpdGggdGhpcyBhc3N1bXB0aW9uIGFuZCBzbyBzb21ldGltZXMgd2hl
bgp3ZSB0cnkgdG8gaG90W3VuXXBsdWcgY3B1cyBhdCBydW4gdGltZSwgc3lzZnMgZGlyZWN0b3Jp
ZXMgZ2V0cyBjb3JydXB0ZWQuCgpUaGlzIHBhdGNoIGZpeGVzIGFjcGktY3B1ZnJlcSBkcml2ZXIg
YWdhaW5zdCB0aGlzIGNvcnJ1cHRpb24uCgpTaWduZWQtb2ZmLWJ5OiBWaXJlc2ggS3VtYXIgPHZp
cmVzaC5rdW1hckBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvY3B1ZnJlcS9hY3BpLWNwdWZyZXEu
YyB8IDE0ICsrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2NwdWZyZXEvYWNwaS1jcHVmcmVx
LmMgYi9kcml2ZXJzL2NwdWZyZXEvYWNwaS1jcHVmcmVxLmMKaW5kZXggOTM3YmMyOC4uY2ViNTky
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9jcHVmcmVxL2FjcGktY3B1ZnJlcS5jCisrKyBiL2RyaXZl
cnMvY3B1ZnJlcS9hY3BpLWNwdWZyZXEuYwpAQCAtNzIyLDE1ICs3MjIsNyBAQCBzdGF0aWMgaW50
IGFjcGlfY3B1ZnJlcV9jcHVfaW5pdChzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeSkKIAlw
ZXJmID0gZGF0YS0+YWNwaV9kYXRhOwogCXBvbGljeS0+c2hhcmVkX3R5cGUgPSBwZXJmLT5zaGFy
ZWRfdHlwZTsKIAotCS8qCi0JICogV2lsbCBsZXQgcG9saWN5LT5jcHVzIGtub3cgYWJvdXQgZGVw
ZW5kZW5jeSBvbmx5IHdoZW4gc29mdHdhcmUKLQkgKiBjb29yZGluYXRpb24gaXMgcmVxdWlyZWQu
Ci0JICovCi0JaWYgKHBvbGljeS0+c2hhcmVkX3R5cGUgPT0gQ1BVRlJFUV9TSEFSRURfVFlQRV9B
TEwgfHwKLQkgICAgcG9saWN5LT5zaGFyZWRfdHlwZSA9PSBDUFVGUkVRX1NIQVJFRF9UWVBFX0FO
WSkgewotCQljcHVtYXNrX2NvcHkocG9saWN5LT5jcHVzLCBwZXJmLT5zaGFyZWRfY3B1X21hcCk7
Ci0JfQotCWNwdW1hc2tfY29weShwb2xpY3ktPnJlbGF0ZWRfY3B1cywgcGVyZi0+c2hhcmVkX2Nw
dV9tYXApOworCWNwdW1hc2tfY29weShwb2xpY3ktPmNwdXMsIHBlcmYtPnNoYXJlZF9jcHVfbWFw
KTsKIAogI2lmZGVmIENPTkZJR19TTVAKIAlkbWlfY2hlY2tfc3lzdGVtKHN3X2FueV9idWdfZG1p
X3RhYmxlKTsKQEAgLTc0MCw5ICs3MzIsNyBAQCBzdGF0aWMgaW50IGFjcGlfY3B1ZnJlcV9jcHVf
aW5pdChzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeSkKIAl9CiAKIAlpZiAoY2hlY2tfYW1k
X2h3cHN0YXRlX2NwdShjcHUpICYmICFhY3BpX3BzdGF0ZV9zdHJpY3QpIHsKLQkJY3B1bWFza19j
bGVhcihwb2xpY3ktPmNwdXMpOwotCQljcHVtYXNrX3NldF9jcHUoY3B1LCBwb2xpY3ktPmNwdXMp
OwotCQljcHVtYXNrX2NvcHkocG9saWN5LT5yZWxhdGVkX2NwdXMsIGNwdV9zaWJsaW5nX21hc2so
Y3B1KSk7CisJCWNwdW1hc2tfY29weShwb2xpY3ktPmNwdXMsIGNwdV9zaWJsaW5nX21hc2soY3B1
KSk7CiAJCXBvbGljeS0+c2hhcmVkX3R5cGUgPSBDUFVGUkVRX1NIQVJFRF9UWVBFX0hXOwogCQlw
cl9pbmZvX29uY2UoUEZYICJvdmVycmlkaW5nIEJJT1MgcHJvdmlkZWQgX1BTRCBkYXRhXG4iKTsK
IAl9Ci0tIAoxLjcuMTIucmMyLjE4Lmc2MWI0NzJlCgo=
--e89a8ff1c2d8d4039104d89bd4cf--
