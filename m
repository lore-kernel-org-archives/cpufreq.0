From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/drivers/cpufreq userspace.c,1.1.1.2,1.1.1.3
Date: Thu, 15 Jul 2004 14:08:05 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1Bl5y1-0002Md-NG@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq
In directory flint:/tmp/cvs-serv9074

Modified Files:
      Tag: LINUX_2_4
	userspace.c 
Log Message:
Fix security hole in proc handler.
 Brad Spengler <spender@grsecurity.net> found an exploitable bug in the proc handler
 of cpufreq, where a user-supplied unsigned int is cast to a signed int and then
 passed on to copy_[to|from]_user() allowing arbitary amounts of memory to be written
 (root only thankfully), or read (as any user).

The Common Vulnerabilities and Exposures project (cve.mitre.org) has assigned
the name CAN-2004-0228 to this issue.



Index: userspace.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/Attic/userspace.c,v
retrieving revision 1.1.1.2
retrieving revision 1.1.1.3
diff -u -r1.1.1.2 -r1.1.1.3
--- userspace.c	28 Aug 2003 13:41:57 -0000	1.1.1.2
+++ userspace.c	15 Jul 2004 13:08:02 -0000	1.1.1.3
@@ -161,7 +161,7 @@
 {
 	char buf[16], *p;
 	int cpu = (int) ctl->extra1;
-	int len, left = *lenp;
+	size_t len, left = *lenp;
 
 	if (!left || (filp->f_pos && !write) || !cpu_online(cpu)) {
 		*lenp = 0;
