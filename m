From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/include/linux cpufreq.h,1.44,1.45
Date: Wed, 03 Sep 2003 10:20:04 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E19uTo4-0005du-Rl@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/include/linux
In directory flint:/tmp/cvs-serv21659/linux/include/linux

Modified Files:
	cpufreq.h 
Log Message:
* add speedstep-smi driver (Hiroshi Miura)
* clean up speedstep-smi driver (Dominik Brodowski)
        - fixes a couple of warnings
        - to run as a module, we need to export ist_info. Also, only show the
          IST_INFO line in dmesg if speedstep_smi is enabled.
        - Use  a new ->resume callback in the cpufreq core.
        - let's call this driver "speedstep-smi" in cpufreq_driver also
        - if the smi_get_freqs call fails, fall back to the "let's try it out
          and see what frequency we are at" mechanism. Needed on my notebook (at
          least).
* update driver/cpufreq/cpufreq.c


Index: cpufreq.h
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/include/linux/cpufreq.h,v
retrieving revision 1.44
retrieving revision 1.45
diff -u -r1.44 -r1.45
--- cpufreq.h	19 Aug 2003 13:38:33 -0000	1.44
+++ cpufreq.h	3 Sep 2003 09:20:00 -0000	1.45
@@ -176,6 +176,7 @@
 
 	/* optional */
 	int	(*exit)		(struct cpufreq_policy *policy);
+	int	(*resume)	(struct cpufreq_policy *policy);
 	struct freq_attr	**attr;
 };
