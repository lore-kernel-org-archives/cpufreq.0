From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [PATCH] Remove notify in speedstep_set_state [1/2]
Date: Thu, 10 Jun 2004 21:26:41 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040610192641.GA13782@poupinou.org>
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

Remove 'notify' in speedstep_set_state for speedstep-lib

Signed-Of-By: Bruno Ducrot <ducrot@poupinou.org>

 arch/i386/kernel/cpu/cpufreq/speedstep-lib.c |   10 ++++------
 arch/i386/kernel/cpu/cpufreq/speedstep-lib.h |    2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)

- --- linux-2.6.7-rc3-mm1/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004/06/10 18:28:39	1.1
+++ linux-2.6.7-rc3-mm1/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004/06/10 18:30:43
@@ -321,9 +321,7 @@ EXPORT_SYMBOL_GPL(speedstep_detect_proce
 unsigned int speedstep_get_freqs(unsigned int processor,
 				  unsigned int *low_speed,
 				  unsigned int *high_speed,
- -				  void (*set_state) (unsigned int state,
- -						     unsigned int notify)
- -				 )
+				  void (*set_state) (unsigned int state))
 {
 	unsigned int prev_speed;
 	unsigned int ret = 0;
@@ -340,7 +338,7 @@ unsigned int speedstep_get_freqs(unsigne
 	local_irq_save(flags);
 
 	/* switch to low state */
- -	set_state(SPEEDSTEP_LOW, 0);
+	set_state(SPEEDSTEP_LOW);
 	*low_speed = speedstep_get_processor_frequency(processor);
 	if (!*low_speed) {
 		ret = -EIO;
@@ -348,7 +346,7 @@ unsigned int speedstep_get_freqs(unsigne
 	}
 
 	/* switch to high state */
- -	set_state(SPEEDSTEP_HIGH, 0);
+	set_state(SPEEDSTEP_HIGH);
 	*high_speed = speedstep_get_processor_frequency(processor);
 	if (!*high_speed) {
 		ret = -EIO;
@@ -362,7 +360,7 @@ unsigned int speedstep_get_freqs(unsigne
 
 	/* switch to previous state, if necessary */
 	if (*high_speed != prev_speed)
- -		set_state(SPEEDSTEP_LOW, 0);
+		set_state(SPEEDSTEP_LOW);
 
  out:
 	local_irq_restore(flags);
- --- linux-2.6.7-rc3-mm1/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h	2004/06/10 18:28:29	1.1
+++ linux-2.6.7-rc3-mm1/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h	2004/06/10 18:47:50
@@ -44,4 +44,4 @@ extern unsigned int speedstep_get_proces
 extern unsigned int speedstep_get_freqs(unsigned int processor,
 	  unsigned int *low_speed,
 	  unsigned int *high_speed,
- -	  void (*set_state) (unsigned int state, unsigned int notify));
+	  void (*set_state) (unsigned int state));

- -- 
Bruno Ducrot

- --  Which is worse:  ignorance or apathy?
- --  Don't know.  Don't care.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAyLXwiZtNKH9GMYcRArLaAJ97vEFTzsoFXBIqFNXsOeOI4nyr1QCeJwod
ewJTE56F+yqKoyN5kx9SxWU=
=+VHa
-----END PGP SIGNATURE-----
