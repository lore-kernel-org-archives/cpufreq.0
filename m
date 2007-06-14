From: "Phil Endecott" <phil_fvnqz_endecott@chezphil.org>
Subject: How does BIOS "thermal throttling" interact with cpufreq? (on VIA
	C7)
Date: Thu, 14 Jun 2007 22:26:59 +0100
Message-ID: <1181856419753@dmwebmail.belize.chezphil.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

Dear Cpufreq experts,

I have a Jetway J7F2 motherboard with a VIA C7 processor and have 
recently got CPU frequency scaling working with the ondemand governor.  
It all works very smoothly - thanks.

In the BIOS settup screens there are options for "thermal throttling".  
They allow me to define a threshold voltage and a "duty cycle"; the 
screens are rather vague and there's nothing about it in the board 
documentation.  My guess is that when the CPU temperature reaches this 
threshold the clock speed is reduced.  I have looked at the datasheet 
for the chip that includes the temperature monitoring logic, and asked 
about it on the lm-sensors (aka hwmon) mailing list, and there seems to 
be an "over temp" output signal from this chip.  (The is also an 
"alarm" output, with a separate threshold register, which I think goes 
to the speaker.)

Does anyone know how this stuff works, and how it interacts with 
cpufreq?  Could it be that the "over temperature" signal is actually 
just an interrupt and software is supposed to respond by changing the 
frequency?  Does cpufreq need to be aware of this throttling function 
(i.e. having enabled cpufreq, have I unintentionally disabled this 
thermal protection?)

Any thoughts would be much appreciated.

Regards,

Phil.
