From: "Mark Langsdorf" <mark.langsdorf@amd.com>
Subject: [PATCH] Support different families in fid/did to frequency
 conversion
Date: Fri, 3 Aug 2007 14:09:05 -0500
Message-ID: <200708031409.05727.mark.langsdorf@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
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
To: cpufreq@lists.linux.org.uk, bhavana.nagendra@amd.com

The equation to find the frequency given the fid and did is family dependant.

Acked-by: Mark Langsdorf <mark.langsdorf@amd.com>
Signed-off-by: Joachim Deguara <joachim.deguara@amd.com>

--
Index: 2.6-git/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
===================================================================
--- 2.6-git.orig/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
+++ 2.6-git/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
@@ -76,7 +76,10 @@ static u32 find_khz_freq_from_fid(u32 fi
 /* Return a frequency in MHz, given an input fid and did */
 static u32 find_freq_from_fiddid(u32 fid, u32 did)
 {
-	return 100 * (fid + 0x10) >> did;
+	if (current_cpu_data.x86 == 0x10)
+		return 100 * (fid + 0x10) >> did;
+	else
+		return 100 * (fid + 0x8) >> did;
 }
 
 static u32 find_khz_freq_from_fiddid(u32 fid, u32 did)
