From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [PATCH] security fix for speedstep-smi
Date: Thu, 10 Jun 2004 21:35:12 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040610193512.GC13782@poupinou.org>
References: <40C5F42D.1050107@cern.ch> <20040608153023.GS13782@poupinou.org>
	<40C6517E.1090708@cern.ch>
	<20040609154710.GA9482@dominikbrodowski.de>
	<40C7AF6C.1080408@cern.ch> <20040610153711.GZ13782@poupinou.org>
	<20040610164434.GA14158@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040610164434.GA14158@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; x-action="pgp-signed"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Looking around speedstep-smi, there is a lot of call to
speedstep_get_state() which is used as an index for the array
speedstep_freqs.  But speedstep_get_state() will return the value of ebx
after a call to a SMI handler.  It's not safe IMHO.

 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

- --- linux-2.6.7-rc3-mm1/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2004/06/10 18:30:54	1.1
+++ linux-2.6.7-rc3-mm1/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2004/06/10 19:12:49
@@ -139,7 +139,7 @@ static int speedstep_get_state (void)
 		: "a" (command), "b" (function), "c" (0), "d" (smi_port), "S" (0)
 	);
 
- -	return state;
+	return (state & 1);
 }
 
 /**


- -- 
Bruno Ducrot

- --  Which is worse:  ignorance or apathy?
- --  Don't know.  Don't care.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAyLfwiZtNKH9GMYcRAhlbAJ42SVKb1w+0sv0Ov2/Jbp8NB+J34wCfcfSv
57zWVNSxfyl5fQzUpzPEYa8=
=J4Ym
-----END PGP SIGNATURE-----
