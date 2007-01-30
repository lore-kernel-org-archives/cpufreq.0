From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: re: [PATCH] fix cpuinfo_cur_freq for CPU_HW_PSTATE
Date: Tue, 30 Jan 2007 10:54:14 -0600
Message-ID: <1449F58C868D8D4E9C72945771150BDFD9655D@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Acked-by: Mark Langsdorf <mark.langsdorf@amd.com>

Subject: [PATCH] fix cpuinfo_cur_freq for CPU_HW_PSTATE

This fixes the cpuinfo_cur_freq value by using the correct
find_khz_freq_from_fiddid() when the CPU uses hardware p-states.

Signed-Off-by: Joachim Deguara <joachim.deguara@amd.com>

--- arch/i386/kernel/cpu/cpufreq/powernow-k8.c.orig	2007-01-30
16:23:39.000000000 +0100
+++ arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2007-01-30
16:26:44.000000000 +0100
@@ -1289,7 +1289,11 @@ static unsigned int powernowk8_get (unsi
 	if (query_current_values_with_pending_wait(data))
 		goto out;

-	khz =3D find_khz_freq_from_fid(data->currfid);
+	if (cpu_family =3D=3D CPU_HW_PSTATE)
+		khz =3D find_khz_freq_from_fiddid(data->currfid,
data->currdid);
+	else
+		khz =3D find_khz_freq_from_fid(data->currfid);
+=09

 out:
 	set_cpus_allowed(current, oldmask);



_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq
