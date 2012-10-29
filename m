From: Andreas Herrmann <herrmann.der.user@googlemail.com>
Subject: [PATCH 4/4] MAINTAINERS: Update email address for Robert Richter
Date: Mon, 29 Oct 2012 18:53:25 +0100
Message-ID: <20121029175325.GE5024@tweety>
References: <20121029174924.GA5024@tweety>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=qJ+KdRpWZfFnAn97ChUyU867SDqXUNc1QQ0ME71T2d0=;
        b=TDZo3FQvaRDEzR/pifVbjtHMBra9I+eRU+4rX6bmADoCh9qjIl1SsfOMfsjqS4PeKh
         ehknHaf9wHVX6kxZLmTL7PzI7KhwN3dJqBKgjsyaoeUU4IBIZ0WX3vx42+gn3YXr1AXb
         RLtkU3d5OIo+IUJ4VWL86pF9VZkV+SAsj13A5Q6khJWQ7276u/pEIS8pGNxY2PfEVahV
         O/1iolx8a8WRoZz79MmrBElkOFQCgc7oj45D0cOcCfB3TZGkrGfjWTM+upnSf7b+QA75
         w7pH5IW+Wg/C65ocG8n+s54GpNGIPfQn3wRBG9UnHaPs1J60PO1400lrzfQOeJu0Vqu2
         4GdA==
Content-Disposition: inline
In-Reply-To: <20121029174924.GA5024@tweety>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>, Jean Delvare <khali@linux-fr.org>, Guenter Roeck <linux@roeck-us.net>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, H Peter Anvin <hpa@zytor.com>
Cc: lm-sensors@lm-sensors.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, oprofile-list@lists.sf.net, Stephane Eranian <eranian@google.com>, Robert Richter <rric@kernel.org>, Borislav Petkov <bp@alien8.de>, =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>

From: Robert Richter <rric@kernel.org>

Signed-off-by: Robert Richter <rric@kernel.org>
Signed-off-by: Andreas Herrmann <herrmann.der.user@googlemail.com>
---
 MAINTAINERS |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5a66583..5b8935b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5363,7 +5363,7 @@ S:	Maintained
 F:	sound/drivers/opl4/
 
 OPROFILE
-M:	Robert Richter <robert.richter@amd.com>
+M:	Robert Richter <rric@kernel.org>
 L:	oprofile-list@lists.sf.net
 S:	Maintained
 F:	arch/*/include/asm/oprofile*.h
-- 
1.7.9.5

