From: Gunter Ohrner <G.Ohrner@post.rwth-aachen.de>
Subject: Re: cpufreq: powernow-k8 frequency transitions question
Date: Wed, 04 Jan 2006 01:47:41 +0100
Message-ID: <dpf5ue$4a0$1@sea.gmane.org>
References: <84EA05E2CA77634C82730353CBE3A84303D430BD@SAUSEXMB1.amd.com>
	<20060103162946.GF13887@poupinou.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@lists.linux.org.uk

Bruno Ducrot wrote:
> I'm wondering if this would have some more power saving if there are more
> low p-states.  I should some day look at this more seriously.

I own a Winchester 3000+ (max. 1,8GHz) which I tried to operate at 800 MHz
(instead of 1,0GHz) but it locked hard. It can be forced to intermediate
out-of-spec speeds (1,2GHz, 1,4GHz and 1,6GHz, although 1,4 should not be
reachable according to AMDs frequency transition spec).

Though I'm not sure if there's any win from these unsupported P-states as
1,0GHz should suffice for most tasks and for everything else the system can
quickly toggle to 1,8 GHz. I currently can't think of any task which would
require more processing power than provided by 1,0GHz but less than
provided by 1,8GHz over a longer period of time, so that the intermediate
P-states would actually be used by the ondemand governor for longer than a
fraction of a second... Though it could be interesting for faster CPUs than
mine that are decoding HD video or similar.

Greetings,

  Gunter

--=20
Ever noticed that people who spend money on beer, cigarettes and drugs=20
are always complaining about being broke and not feeling well?       =20
-- Unbekannter Autor
*** PGP-Verschl=FCsselung bei eMails erw=FCnscht :-) *** PGP: 0x1128F25F ***
