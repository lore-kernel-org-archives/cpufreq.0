From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [PATCH] security fix for speedstep-smi
Date: Fri, 11 Jun 2004 12:06:49 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040611100649.GF1095@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

Looking around speedstep-smi, there is a lot of call to
speedstep_get_state() which is used as an index for the array
speedstep_freqs.  But speedstep_get_state() will return the value of ebx
after a call to a SMI handler.  It's not safe IMHO.


 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

--- linux-2.6.7-rc3-mm1/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2004/06/10 18:30:54	1.1
+++ linux-2.6.7-rc3-mm1/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2004/06/10 19:12:49
@@ -139,7 +139,7 @@ static int speedstep_get_state (void)
 		: "a" (command), "b" (function), "c" (0), "d" (smi_port), "S" (0)
 	);
 
-	return state;
+	return (state & 1);
 }
 
 /**


-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
