From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patchin.sh,1.1.1.2,1.1.1.3
Date: Wed, 27 Aug 2003 15:14:35 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E19s14F-000198-JH@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq
In directory flint:/tmp/cvs-serv4403

Modified Files:
      Tag: LINUX_2_4
	patchin.sh 
Log Message:
move kernel/cpufreq.c to driver/cpufreq (Dominik Brodowski)

Index: patchin.sh
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patchin.sh,v
retrieving revision 1.1.1.2
retrieving revision 1.1.1.3
diff -u -r1.1.1.2 -r1.1.1.3
--- patchin.sh	27 Aug 2003 10:27:09 -0000	1.1.1.2
+++ patchin.sh	27 Aug 2003 14:14:32 -0000	1.1.1.3
@@ -16,7 +16,6 @@
 
 ln -sf $cpufreq/linux/Documentation/cpufreq $1/Documentation/cpu-freq
 ln -sf $cpufreq/linux/Documentation/cpufreq-old $1/Documentation/cpufreq-old
-ln -sf $cpufreq/linux/kernel/cpufreq.c $1/kernel/
 ln -sf $cpufreq/linux/include/linux/cpufreq.h $1/include/linux/
 ln -sf $cpufreq/linux/drivers/cpufreq $1/drivers/cpufreq
