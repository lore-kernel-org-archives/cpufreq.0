From: Reimar =?iso-8859-1?Q?D=F6ffinger?=
	<Reimar.Doeffinger@stud.uni-karlsruhe.de>
Subject: Re: [PATCH] allow powersave as default governor
Date: Thu, 15 Jun 2006 22:54:28 +0200
Message-ID: <20060615205428.GA10507@rz.uni-karlsruhe.de>
References: <CFF307C98FEABE47A452B27C06B85BB6B89BF1@hdsmsx411.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <CFF307C98FEABE47A452B27C06B85BB6B89BF1@hdsmsx411.amr.corp.intel.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@lists.linux.org.uk

Hello,

I accidentially sent this only to the author of the previous mail
instead of the list, so another try...

On Tue, Jun 13, 2006 at 03:52:01PM -0400, Brown, Len wrote:
> >On Wed, May 31, 2006 at 07:05:30PM +0200, Reimar D?ffinger wrote:
> >> this patch against linux 2.6.16.16 kernel adds the powersave=20
> >governor to
> >> the list of possible default governors.
> >> Avoids noisy fan e.g. during fsck when no userspace governor=20
> >> is running yet.
>=20
> What MHz does the noisy system boot at when cpufreq is not loaded at all?

2GHz (i.e. full speed), and since it is a AMD64 laptop system, that means q=
uite
noisy even if CPU usage is < 10 %

> If it boots in low-frequency-mode, then perhaps cpufreq should
> not load any governor until it can load its governor of choice,
> and the window where this issue is seen would go away?

Not sure I understand both the question and the code, but I would expect
that selecting "userspace" as governor would keep the frequency that the
BIOS or whatever sets before booting.
Oh, just to avoid a possible misunderstanding, when I said "when no
userspace governor is running yet" I meant by "userspace governor"
something like powernowd.

Greetings,
Reimar D=F6ffinger
