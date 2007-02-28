From: "stefano ferri" <ferriste@libero.it>
Subject: Re: [Bug 8081] Conservative governor sets wrong and too high
	sampling rates
Date: Wed, 28 Feb 2007 09:33:25 +0100
Message-ID: <JE5ZRP$B081F2DA00BA3B983E6C3095805551EA@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: rafalbilski <rafalbilski@interia.pl>
Cc: cpufreq <cpufreq@lists.linux.org.uk>


> > I hope we can agree a little on this... If you want the kernel 
> > set a default value of 1 second ok, but let users free to set it 
> > to a vrey lower value decreasing the value contained in sampling_rate=
_min.
> I agree.

Ok :-)

> Current value is good for me.

Rafal, I believe that, but you should consider that for some people curre=
nt values are not the best... With the new code you wrote the governor sh=
ould satisfy more users. I'll try the patch as soon as possible.
So now, if I have a default sampling rate of 199000, the min will be 1990=
0... good


> OK. Patch below is touching only min value. It is for 2.6.20. Is it suf=
ficent?

Yes, if it will be a change in the next release of the kernel!

Thanks
Stefano





=0A=0A=0A------------------------------------------------------=0APassa a=
 Infostrada. ADSL e Telefono senza limiti e senza canone Telecom=0Ahttp:/=
/click.libero.it/infostrada28eb07=0A
