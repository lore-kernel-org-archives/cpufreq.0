From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patchin.sh,1.1.1.7,1.1.1.8
Date: Tue, 04 Jan 2005 09:18:40 +0000
Message-ID: <E1Clkps-0002rA-CU@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq
In directory flint:/tmp/cvs-serv10975/cpufreq

Modified Files:
      Tag: LINUX_2_4
	patchin.sh 
Log Message:
From Sergio Monteiro Basto:
more than trivial
Documentation , not Docmuentation.
This clean one warning when apply for 2nd time on same kernel.


Index: patchin.sh
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patchin.sh,v
retrieving revision 1.1.1.7
retrieving revision 1.1.1.8
diff -u -r1.1.1.7 -r1.1.1.8
--- patchin.sh	26 Aug 2004 16:11:27 -0000	1.1.1.7
+++ patchin.sh	4 Jan 2005 09:18:37 -0000	1.1.1.8
@@ -14,7 +14,7 @@
 	exit 1
 fi
 
-rm -rf $cpufreq/linux/Docmuentation/cpu-freq
+rm -rf $cpufreq/linux/Documentation/cpu-freq
 ln -sf cpufreq $cpufreq/linux/Documentation/cpu-freq
 
 diff -Nur -x"*CVS*" $1/Documentation/cpu-freq linux/Documentation/cpu-freq > patch_core
