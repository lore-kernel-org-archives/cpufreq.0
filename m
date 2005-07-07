From: Dave Jones <davej@redhat.com>
Subject: Re: enhanced intel speedstep feature was Re: speedstep-centrino on
	dothan
Date: Thu, 7 Jul 2005 16:06:48 -0400
Message-ID: <20050707200648.GA29142@redhat.com>
References: <20050706112202.33d63d4d@horst.morte.male>
	<42CC37FD.5040708@tmr.com> <20050706211159.GF27630@redhat.com>
	<20050706235557.0c122d33@horst.morte.male>
	<20050707220027.413343d4@horst.morte.male>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050707220027.413343d4@horst.morte.male>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: st3@riseup.net
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

On Thu, Jul 07, 2005 at 10:00:27PM +0200, st3@riseup.net wrote:
  > Enabling, say, a duty cycle of 12.5% means that the CPU chip will be driven
 > by clock just one time every eight, thus reducing power consumption and
 > temperature (and it speeds down dramatically the CPU, too =).
 > 
 > I tested it so far on my Pentium M Dothan 715 and on a Dothan 725.
 > 
 > What do you think, could this be useful? I could provide a patch or a
 > stand-alone module. Should I write an interface to sysfs?

You just reinvented the p4-clockmod driver :-)
This hasn't been seen to save any power whatsoever that I've seen.
I've heard a few reports that it reduces heat for a few folks, but
betting on it increasing your battery life is probably a push.

		Dave
