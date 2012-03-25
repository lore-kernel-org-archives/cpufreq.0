From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 04/13] cpupower: Unify cpupower-frequency-* manpages
Date: Sun, 25 Mar 2012 20:38:45 +0200
Message-ID: <1332700734-26435-4-git-send-email-linux@dominikbrodowski.net>
References: <20120325183807.GA26398@comet.dominikbrodowski.net>
 <1332700734-26435-1-git-send-email-linux@dominikbrodowski.net>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1332700734-26435-1-git-send-email-linux@dominikbrodowski.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Thomas Renninger <trenn@suse.de>, Dominik Brodowski <linux@dominikbrodowski.net>

From: Thomas Renninger <trenn@suse.de>

cpupower-frequency-* manpages slightly differed from the others.
  - Use uppercase letters in the title
  - Show cpupower Manual in the header
  - Remove Mattia from left down corner of the manpage, he is already
    listed as author
  - Remove --help, prints this message -> not needed

Signed-off-by: Thomas Renninger <trenn@suse.de>
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 tools/power/cpupower/man/cpupower-frequency-info.1 |    4 +---
 tools/power/cpupower/man/cpupower-frequency-set.1  |    4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/tools/power/cpupower/man/cpupower-frequency-info.1 b/tools/power/cpupower/man/cpupower-frequency-info.1
index bb60a8d..4a1918e 100644
--- a/tools/power/cpupower/man/cpupower-frequency-info.1
+++ b/tools/power/cpupower/man/cpupower-frequency-info.1
@@ -1,4 +1,4 @@
-.TH "cpupower-frequency-info" "1" "0.1" "Mattia Dongili" ""
+.TH "CPUPOWER\-FREQUENCY\-INFO" "1" "0.1" "" "cpupower Manual"
 .SH "NAME"
 .LP 
 cpupower frequency\-info \- Utility to retrieve cpufreq kernel information
@@ -50,8 +50,6 @@ Prints out information like provided by the /proc/cpufreq interface in 2.4. and
 \fB\-m\fR \fB\-\-human\fR
 human\-readable output for the \-f, \-w, \-s and \-y parameters.
 .TP  
-\fB\-h\fR \fB\-\-help\fR
-Prints out the help screen.
 .SH "REMARKS"
 .LP 
 By default only values of core zero are displayed. How to display settings of
diff --git a/tools/power/cpupower/man/cpupower-frequency-set.1 b/tools/power/cpupower/man/cpupower-frequency-set.1
index 685f469..3eacc8d 100644
--- a/tools/power/cpupower/man/cpupower-frequency-set.1
+++ b/tools/power/cpupower/man/cpupower-frequency-set.1
@@ -1,4 +1,4 @@
-.TH "cpupower-freqency-set" "1" "0.1" "Mattia Dongili" ""
+.TH "CPUPOWER\-FREQUENCY\-SET" "1" "0.1" "" "cpupower Manual"
 .SH "NAME"
 .LP 
 cpupower frequency\-set \- A small tool which allows to modify cpufreq settings.
@@ -26,8 +26,6 @@ specific frequency to be set. Requires userspace governor to be available and lo
 \fB\-r\fR \fB\-\-related\fR
 modify all hardware-related CPUs at the same time
 .TP 
-\fB\-h\fR \fB\-\-help\fR
-Prints out the help screen.
 .SH "REMARKS"
 .LP 
 By default values are applied on all cores. How to modify single core
-- 
1.7.5.4

