From: Stefan Seyfried <seife@suse.de>
Subject: Re: [patch 1/1] cpufreq_conservative: invert meaning of
	'ignore_nice'
Date: Fri, 30 Sep 2005 15:56:56 +0200
Message-ID: <433D4428.3050906@suse.de>
References: <20050929084435.GC3169@inskipp.digriz.org.uk>	<200509291346.33855.blaisorblade@yahoo.it>
	<20050929215153.GF31516@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20050929215153.GF31516@redhat.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Jones <davej@redhat.com>
Cc: Andrew Morton <akpm@osdl.org>, Alexander Clouter <alex@digriz.org.uk>, cpufreq@lists.linux.org.uk, Blaisorblade <blaisorblade@yahoo.it>, LKML <linux-kernel@vger.kernel.org>, alex-kernel@digriz.org.uk

Dave Jones wrote:
> On Thu, Sep 29, 2005 at 01:46:33PM +0200, Blaisorblade wrote:

>  > So userspace tools will error out rather than do the reverse of what t=
hey were=20
>  > doing, and the user will fix the thing according to the (new) docs.
>=20
> Agreed. If we change this, we change it completely.
> Stefan already mentioned his app will break, and we typically don't
> find out about widespread breakage until after we ship a release.

I can live with the change - powersaved has a setting "consider_nice" to
configure this and i can put out a support article telling people to
"invert" this setting if they are running custom kernels, so it is not
really a showstopper for me. Most of the users don't understand thos
settings anyway ;-)

I'm not sure what is better for me - a nice short name or a clear
indication on which version we are running ;-)
--=20
Stefan Seyfried                  \ "I didn't want to write for pay. I
QA / R&D Team Mobile Devices      \ wanted to be paid for what I write."
SUSE LINUX Products GmbH, N=FCrnberg \                    -- Leonard Cohen
