From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq powernow-k7.c,1.42,1.43
Date: Fri, 04 Jul 2003 16:18:59 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <E19YSKx-0005x1-7z@flint.arm.linux.org.uk>
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv22865

Modified Files:
	powernow-k7.c 
Log Message:
typo fix.  change_VID(fid) is not change_VID(vid)  (Luigi Belli)


Index: powernow-k7.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k7.c,v
retrieving revision 1.42
retrieving revision 1.43
diff -u -r1.42 -r1.43
--- powernow-k7.c	16 Jun 2003 20:39:11 -0000	1.42
+++ powernow-k7.c	4 Jul 2003 15:18:55 -0000	1.43
@@ -268,8 +268,8 @@
 		change_VID(vid);
 	} else {
 		/* Going up, so change VID first */
-		change_VID(fid);
-		change_FID(vid);
+		change_VID(vid);
+		change_FID(fid);
 	}
 	
