From: Mattia Dongili <malattia@linux.it>
Subject: [cpufrequtils patch] add a newline
Date: Mon, 27 Mar 2006 01:21:49 +0200
Message-ID: <20060326232148.GB4548@inferi.kami.home>
References: <20060326101231.GA19126@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="3XA6nns4nE4KvaS/"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060326101231.GA19126@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk
Cc: Dominik Brodowski <linux@dominikbrodowski.net>


--3XA6nns4nE4KvaS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

one more patch, I'm really sorry I actually had it pending around here
for some time but totally forgot to send it... here it is.
It simply adds a new line to an error message, I also updated the po's
files.

bye
-- 
mattia
:wq!

--3XA6nns4nE4KvaS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline; filename="add_newline_to_error_msg.diff"

--- cpufrequtils-001/utils/set.c	2006-03-26 12:02:01.000000000 +0200
+++ cpufrequtils-001.dirty/utils/set.c	2006-03-27 01:13:15.496433930 +0200
@@ -279,7 +279,7 @@
 		struct cpufreq_policy *cur_pol = cpufreq_get_policy(cpu);
 		struct cpufreq_policy new_pol;
 		if (!cur_pol) {
-			printf(gettext ("wrong, unknown or unhandled CPU?"));
+			printf(gettext ("wrong, unknown or unhandled CPU?\n"));
 			return -EINVAL;
 		}
 
diff -u cpufrequtils-001/po/de.po cpufrequtils-001.dirty/po/de.po
--- cpufrequtils-001/po/de.po	2006-03-26 12:02:01.000000000 +0200
+++ cpufrequtils-001.dirty/po/de.po	2006-03-27 01:12:49.338799180 +0200
@@ -340,8 +340,8 @@
 
 #: utils/set.c:282
 #, c-format
-msgid "wrong, unknown or unhandled CPU?"
-msgstr "unbekannte oder nicht regelbare CPU"
+msgid "wrong, unknown or unhandled CPU?\n"
+msgstr "unbekannte oder nicht regelbare CPU\n"
 
 #: utils/set.c:306
 #, c-format
diff -u cpufrequtils-001/po/fr.po cpufrequtils-001.dirty/po/fr.po
--- cpufrequtils-001/po/fr.po	2006-03-26 12:02:01.000000000 +0200
+++ cpufrequtils-001.dirty/po/fr.po	2006-03-27 01:13:34.489620930 +0200
@@ -329,8 +329,8 @@
 
 #: utils/set.c:282
 #, c-format
-msgid "wrong, unknown or unhandled CPU?"
-msgstr "CPU inconnu ou non support? ?"
+msgid "wrong, unknown or unhandled CPU?\n"
+msgstr "CPU inconnu ou non support? ?\n"
 
 #: utils/set.c:306
 #, c-format
diff -u cpufrequtils-001/po/it.po cpufrequtils-001.dirty/po/it.po
--- cpufrequtils-001/po/it.po	2006-03-26 12:02:01.000000000 +0200
+++ cpufrequtils-001.dirty/po/it.po	2006-03-27 01:12:57.999340430 +0200
@@ -337,8 +337,8 @@
 
 #: utils/set.c:282
 #, c-format
-msgid "wrong, unknown or unhandled CPU?"
-msgstr "CPU errata, sconosciuta o non gestita?"
+msgid "wrong, unknown or unhandled CPU?\n"
+msgstr "CPU errata, sconosciuta o non gestita?\n"
 
 #: utils/set.c:306
 #, c-format

--3XA6nns4nE4KvaS/
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--3XA6nns4nE4KvaS/--

