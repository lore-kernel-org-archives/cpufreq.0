From: Andi Kleen <ak@muc.de>
Subject: Re: Athlon 64 complains of frequency mismatch
Date: Tue, 22 Jun 2004 12:28:12 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <m3hdt3evk3.fsf@averell.firstfloor.org>
References: <84EA05E2CA77634C82730353CBE3A8431990B9@SAUSEXMB1.amd.com>
	<1087889453.2704.11.camel@laptop.fenrus.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <1087889453.2704.11.camel@laptop.fenrus.com> (Arjan van de
	Ven's message of "Tue, 22 Jun 2004 09:30:53 +0200")
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
To: arjanv@redhat.com
Cc: cpufreq@www.linux.org.uk

Arjan van de Ven <arjanv@redhat.com> writes:

>> I did intend to make this data module parameters, but have not
>
> how about a sysfs file instead ?
>
>> had the time to do so yet. You can find the correct data values
>> for your processor from the "Power and Thermal" pdfs available 
>> on www.amd.com. Let me know if you want a copy of this hardcoded
>> driver (or it is easy to modify the driver ourself).
>
> hmmm I wonder if say x86info or similar app can include those tables and
> put them into the sysfs file during system boot..... to bypass the
> firmware dependancy entirely. x86info has lots of cpu low level stuff
> already so it just might fit there...

I thought some laptops had limited thermal design and required
more restrictions? e.g. it may not be safe to bypass the BIOS completely.
Or at least not automatically when you don't know what you're doing.

-Andi
