From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/Documentation/cpufreq user-guide.txt,1.5,1.6
Date: Tue, 30 Sep 2003 10:26:29 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1A4Gm5-0005Vh-O9@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq/linux/Documentation/cpufreq
In directory flint:/tmp/cvs-serv21174/linux/Documentation/cpufreq

Modified Files:
	user-guide.txt 
Log Message:
Merge AMD Opteron/Athlon64 powernow driver.

Index: user-guide.txt
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/Documentation/cpufreq/user-guide.txt,v
retrieving revision 1.5
retrieving revision 1.6
diff -u -r1.5 -r1.6
--- user-guide.txt	19 Aug 2003 13:38:31 -0000	1.5
+++ user-guide.txt	30 Sep 2003 09:26:27 -0000	1.6
@@ -57,6 +57,8 @@
 AMD mobile K6-3+
 AMD mobile Duron
 AMD mobile Athlon
+AMD Opteron
+AMD Athlon 64
 Cyrix Media GXm
 Intel mobile PIII and Intel mobile PIII-M on certain chipsets
 Intel Pentium 4, Intel Xeon
