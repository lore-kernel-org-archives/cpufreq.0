From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: VIA C3 M10k Nehemiah longhaul support in 2.6.x ?
Date: Mon, 1 Mar 2004 14:00:19 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040301130019.GQ2869@poupinou.org>
References: <EFEF4C473088B847B64CD953D2A6A104FE8228@sdso14a.par.siemens.fr>
	<5.1.0.14.2.20040227203914.00a86e20@pop.cogeco.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <5.1.0.14.2.20040227203914.00a86e20@pop.cogeco.ca>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Doug Sutherland <wearable@cogeco.ca>
Cc: BARRE Francois <francois.barre@siemens.com>, cpufreq@www.linux.org.uk

On Fri, Feb 27, 2004 at 08:49:46PM -0500, Doug Sutherland wrote:
> Fran=E7ois wrote:
>=20
> > [Nehemiah longhaul] Not seems to be supported still in actual
> > 2.6.3-bk9 version, although it was working on 2.4.x
>=20
> Are you sure Nehemiah was supported for 2.4 kernels?
> I just patched a 2.4.25 kernel with cpufreq.
> I have a Nehemiah model 9 stepping 4 processor.

longhaul support under 2.4 should be the exact same than the 2.6 version
from the cpufreq bk tree made by Dave.  No more, no less.  There may be
a miss sometimes though, depending when the backport is made, and I must
confess I don't have looked recently on the most recent bits from Dave
for the longhaul driver.

> http://www3.sympatico.ca/howlettfamily/epia/longhaul-1.2.tar.gz
> See this in the viaarena forums
> http://forums.viaarena.com/messageview.cfm?catid=3D4&threadid=3D52209

I will look on this.

--=20
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
