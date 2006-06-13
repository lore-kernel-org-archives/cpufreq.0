From: GoatZilla <goatzilla@gmail.com>
Subject: Re: [PATCH] allow powersave as default governor
Date: Tue, 13 Jun 2006 16:39:15 -0500
Message-ID: <39e348480606131439k340428a9l416ef319492cd25a@mail.gmail.com>
References: <20060531170530.GA9967@rz.uni-karlsruhe.de>
	<20060613194613.GA10984@rz.uni-karlsruhe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060613194613.GA10984@rz.uni-karlsruhe.de>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: cpufreq@lists.linux.org.uk

I suggested this about two years ago; the response was "go write a startup
script".



On 6/13/06, Reimar D=F6ffinger <Reimar.Doeffinger@stud.uni-karlsruhe.de>
wrote:
>
> Hello,
> On Wed, May 31, 2006 at 07:05:30PM +0200, Reimar D?ffinger wrote:
> > this patch against linux 2.6.16.16 kernel adds the powersave governor t=
o
> > the list of possible default governors.
> > Avoids noisy fan e.g. during fsck when no userspace governor is running
> > yet.
> > Tested and in use on my Athlon 64 notebook, running in 64 bit mode.
>
> Any news on this? Any interest? Should I try sending to some other list
> as well, linux-kernel or so? Or should I just be a bit more patient? :-)
>
> Greetings,
> Reimar D=F6ffinger
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
