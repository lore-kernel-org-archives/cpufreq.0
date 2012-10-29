From: Andreas Herrmann <herrmann.der.user@googlemail.com>
Subject: [PATCH 2/4] x86, microcode_amd: Change email addresses, MAINTAINERS
 entry
Date: Mon, 29 Oct 2012 18:51:38 +0100
Message-ID: <20121029175138.GC5024@tweety>
References: <20121029174924.GA5024@tweety>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=id0LS0AvJwRz86vFRsAOH8JVdPLvtXHNpEz7DAApNa8=;
        b=ecJ6FaWCKMcmY6RJZMc9syTty+mnwwxRqFvCst/kdBF1MVD/gDJVCM0bjp/1asVvqv
         MSfysaGo36mjFi6XqlmXyM7X3IDKlWTklqUKPQUlI/kRo3KxWnsTI/HfS0R/Uiajwmic
         ZNTPc1AZ4jIM3KCTwZ4s5ftGzpIRYoa6oI+ErEWiO7P6nweH+war88lo7AJtaewvg5KJ
         JEQhC6ZzhbKsCqLJVWwYFanf970AgwtAW+mghBkjs6jyyg4b1DIsZb0U7KXUbXwaTOsh
         09s7oF1pZZJpG2R+28s7Q5JqyJVzbyNtoLuF3SdX2Bc5bClUbyVh+CwA5hKR5rHRNtYx
         DyVQ==
Content-Disposition: inline
In-Reply-To: <20121029174924.GA5024@tweety>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>, Jean Delvare <khali@linux-fr.org>, Guenter Roeck <linux@roeck-us.net>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, H Peter Anvin <hpa@zytor.com>
Cc: lm-sensors@lm-sensors.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, oprofile-list@lists.sf.net, Stephane Eranian <eranian@google.com>, Robert Richter <rric@kernel.org>, Borislav Petkov <bp@alien8.de>, =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>


Signed-off-by: Andreas Herrmann <herrmann.der.user@googlemail.com>
---
 MAINTAINERS                     |    4 ++--
 arch/x86/kernel/microcode_amd.c |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a4e8136..5a66583 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -534,9 +534,9 @@ F:	drivers/iommu/amd_iommu*.[ch]
 F:	include/linux/amd-iommu.h
 
 AMD MICROCODE UPDATE SUPPORT
-M:	Andreas Herrmann <andreas.herrmann3@amd.com>
+M:	Andreas Herrmann <herrmann.der.user@googlemail.com>
 L:	amd64-microcode@amd64.org
-S:	Supported
+S:	Maintained
 F:	arch/x86/kernel/microcode_amd.c
 
 AMS (Apple Motion Sensor) DRIVER
diff --git a/arch/x86/kernel/microcode_amd.c b/arch/x86/kernel/microcode_amd.c
index 7720ff5..b3e67ba 100644
--- a/arch/x86/kernel/microcode_amd.c
+++ b/arch/x86/kernel/microcode_amd.c
@@ -8,8 +8,8 @@
  *  Tigran Aivazian <tigran@aivazian.fsnet.co.uk>
  *
  *  Maintainers:
- *  Andreas Herrmann <andreas.herrmann3@amd.com>
- *  Borislav Petkov <borislav.petkov@amd.com>
+ *  Andreas Herrmann <herrmann.der.user@googlemail.com>
+ *  Borislav Petkov <bp@alien8.de>
  *
  *  This driver allows to upgrade microcode on F10h AMD
  *  CPUs and later.
-- 
1.7.9.5

