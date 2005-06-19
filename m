From: Felix Krull <kilmarnock@gmx.net>
Subject: Support for Mobile Athlon XP - M ?
Date: Sun, 19 Jun 2005 11:01:07 +0200
Message-ID: <42B53453.2020304@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Hi!

I modified my Athlon XP (Barton core) to be a mobile XP - M by bridging 
some open bridges according to http://fab51.com/cpu/barton/athlon-e24.html .
I booted my old Win installation and checked the success with 
CrystalCPUID. x86info mentions the cpu to be PowerNow capable:

PowerNOW! Technology information
Available features:
         Temperature sensing diode present.
         Bus divisor control
         Voltage ID control

But unfortunatelly cpufreq does not seem to support my XP-M. I am not 
able to load the module powernow-k7 into the kernel. There is no entry 
for cpufreq under the /sys tree.

Is there a way to get cpufreq working with this upgraded cpu or will I 
have to downgrade my installation to win in order to slow down my cpu?

Greetings
Felix
