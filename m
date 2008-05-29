From: "Nathan Coulson" <conathan@gmail.com>
Subject: Filing a bugreport, P4-Clockmod on underclocked processors
Date: Thu, 29 May 2008 02:33:43 -0600
Message-ID: <d26773310805290133k3d98e4b3xfb4099842675b3fc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

Hello

I was examing the use of P4-clockmod on the EeePC, with the reports in
/proc/cpuinfo

It has a 900Mhz Celeron M Processor, running at 630Mhz by default.

It reports 112 as the lowest possible setting, and 900 at the highest
possible setting.
with CPU Freuency disabled, it reports 630Mhz.


I noted the following results, when experimenting with setting the frequencies
- no CPU Frequency Scailing in kernel, I obtain 550 Fps w/ glxgears
- CPU Frequency Scailing Enabled, set to run at 900Mhz, I obtain 550fps.
- CPU Frequency Scailing Enabled, set to run at 630Mhz,  Obtained 400fps.

This would imply that the P4 Clockmod's scale is off, as it seems to
be Dependant on the maximum possible speed of the processor (As
opposed to the maximum speed that P4 clockmod can actually set the
Celeron M Processor to).

-- 
Nathan Coulson (conathan)
------
Location: Alberta, Canada
Timezone: MST (-7)
Webpage: http://www.nathancoulson.com
