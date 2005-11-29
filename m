From: Mattia Dongili <malattia@linux.it>
Subject: [RFC][PATCH 0/0] measure speedstep-ich transition latency at CPU
	initialization
Date: Wed, 30 Nov 2005 00:58:31 +0100
Message-ID: <11333087113994-git-send-email-malattia@linux.it>
Reply-To: Mattia Dongili <malattia@linux.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: 
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
Content-Type: text/plain; charset="us-ascii"
To: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>

Hello,                                      
a foreword: this is my first patch here, it surely needs more work but I'd
appreciate some comments before going too far on the wrong lane.  Oh, I'm also
trying to use some git automation to send the patch, hopefully you won't
receive too many dups :)

The 2 patches are trying to implement the suggested runtime measurement
of transition latency on speedstep ich chipsets to offer the
allow the usage of the dynamic governors to ICH[234]-M owners (like me).

The first patch moves away PMBASE reading and only performs it at
cpufreq_register_driver time by exiting with -ENODEV if unable to read
the value. (git seems a little confused, I hope it's readable)

The second patch (could be split in 2 if necessary) introduces
__speedstep_set_state that performs the frequency transition without
disabling interrupts to be used in speedstep_measure_latency and
speedstep_get_freqs (IRQs are already disabled here).
It also implements the transition measurement if the parameter
'measure_latency' is set to a value other than 0.

The measurement is performed by means of do_gettimeofday as suggested by
Mr. Pallipadi.

Known problems:
- the patch is still missing a sanity check on the measured value
- it also introduces 2 more transitions at init time (2 in
  speedstep_get_freqs + 2 in speedstep_measure_latency) because I don't
  know if makes sense to rely (and hack) on speedstep_get_freqs to perform
  measurements.

thanks
--
mattia
:wq!
