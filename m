From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH] cpufreq: update Documentation/cpu-freq/user-guide.txt to reflect newly merged architecture support
Date: Wed, 2 Jul 2003 08:30:56 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030702063056.GA1602@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@suse.de, cpufreq@www.linux.org.uk

--- 2.5.73-bk8/Documentation/cpu-freq/user-guide.txt.original	2003-06-30 20:20:19.000000000 +0200
+++ 2.5.73-bk8/Documentation/cpu-freq/user-guide.txt	2003-07-02 08:28:44.000000000 +0200
@@ -21,6 +21,8 @@
 1.1 ARM
 1.2 x86
 1.3 sparc64
+1.4 ppc
+1.5 SuperH
 
 2. "Policy" / "Governor"?
 2.1 Policy
@@ -77,6 +79,20 @@
 UltraSPARC-III
 
 
+1.4 ppc
+-------
+
+Several "PowerBook" and "iBook2" notebooks are supported.
+
+
+1.5 SuperH
+----------
+
+The following SuperH processors are supported by cpufreq:
+
+SH-3
+SH-4
+
 
 2. "Policy" / "Governor" ?
 ==========================
