From: Dave Jones <davej@redhat.com>
Subject: Re: speedstep capability checks
Date: Mon, 15 Mar 2004 21:09:50 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040315210950.GC15243@redhat.com>
References: <20040314152016.0B04B3F04@latitude.mynet.no-ip.org>
	<20040315141517.GG8636@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040315141517.GG8636@dominikbrodowski.de>
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
To: aeriksson@fastmail.fm, Arjan van de Ven <arjanv@redhat.com>, cpufreq@www.linux.org.uk

On Mon, Mar 15, 2004 at 03:15:17PM +0100, Dominik Brodowski wrote:
 > @@ -265,6 +272,12 @@
 >  		ebx = cpuid_ebx(0x00000001);
 >  
 >  		ebx &= 0x000000FF;
 > +
 > +		/* Arjan reported a strange mobile PIII-M where ebx is
 > +		   0x07 */
 > +		if ((ebx == 0x07) && relaxed_check)
 > +			return SPEEDSTEP_PROCESSOR_PIII_T;
 > +
 >  		if (ebx != 0x06)
 >  			return 0;

Any reason we can't just check the ebx==0x07, guarded with appropriate
checks on model/stepping/brand ? The relaxed_check stuff does seem quite ugly to me.

		Dave
