From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [PATCH] Remove notify in speedstep_set_state [2/2]
Date: Thu, 10 Jun 2004 21:28:01 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040610192801.GB13782@poupinou.org>
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

Remove notify in speedstep_set_state [2/2]

This is for speedstep-smi.

Signed-Of-By: Bruno Ducrot <ducrot@poupinou.org>

 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |   32 ++++++++++-----------------
 1 files changed, 13 insertions(+), 19 deletions(-)

- --- linux-2.6.7-rc3-mm1/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2004/06/10 19:13:22	1.2
+++ linux-2.6.7-rc3-mm1/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2004/06/10 19:17:17
@@ -145,31 +145,18 @@ static int speedstep_get_state (void)
 /**
  * speedstep_set_state - set the SpeedStep state
  * @state: new processor frequency state (SPEEDSTEP_LOW or SPEEDSTEP_HIGH)
- - * @notify: whether to call cpufreq_notify_transition
  *
  */
- -static void speedstep_set_state (unsigned int state, unsigned int notify)
+static void speedstep_set_state (unsigned int state)
 {
- -	unsigned int old_state, result = 0, command, new_state;
+	unsigned int result = 0, command, new_state;
 	unsigned long flags;
- -	struct cpufreq_freqs freqs;
 	unsigned int function=SET_SPEEDSTEP_STATE;
 	unsigned int retry = 0;
 
 	if (state > 0x1)
 		return;
 
- -	old_state = speedstep_get_state();
- -	freqs.old = speedstep_freqs[old_state].frequency;
- -	freqs.new = speedstep_freqs[state].frequency;
- -	freqs.cpu = 0; /* speedstep.c is UP only driver */
- -
- -	if (old_state == state)
- -		return;
- -
- -	if (notify)
- -		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
- -
 	/* Disable IRQs */
 	local_irq_save(flags);
 
@@ -198,9 +185,6 @@ static void speedstep_set_state (unsigne
 		printk(KERN_ERR "cpufreq: change failed with new_state %u and result %u\n", new_state, result);
 	}
 
- -	if (notify)
- -		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
- -
 	return;
 }
 
@@ -217,11 +201,21 @@ static int speedstep_target (struct cpuf
 			unsigned int target_freq, unsigned int relation)
 {
 	unsigned int newstate = 0;
+	struct cpufreq_freqs freqs;
 
 	if (cpufreq_frequency_table_target(policy, &speedstep_freqs[0], target_freq, relation, &newstate))
 		return -EINVAL;
 
- -	speedstep_set_state(newstate, 1);
+	freqs.old = speedstep_freqs[speedstep_get_state()].frequency;
+	freqs.new = speedstep_freqs[newstate].frequency;
+	freqs.cpu = 0; /* speedstep.c is UP only driver */
+
+	if (freqs.old == freqs.new)
+		return 0;
+
+	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+	speedstep_set_state(newstate);
+	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 
 	return 0;
 }

- -- 
Bruno Ducrot

- --  Which is worse:  ignorance or apathy?
- --  Don't know.  Don't care.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAyLZBiZtNKH9GMYcRAv6eAKCJINQlfzWXPEHXri8v3zc+VhdklQCfXiXT
PnuBJapbMHvGslvKRIVLJuU=
=VHyT
-----END PGP SIGNATURE-----
