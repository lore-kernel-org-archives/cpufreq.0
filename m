From: Gunter Ohrner <G.Ohrner@post.rwth-aachen.de>
Subject: cpufreq: powernow-k8 frequency transitions question
Date: Sun, 01 Jan 2006 13:13:26 +0100
Message-ID: <dp8h08$du6$1@sea.gmane.org>
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

Hi!

I already asked this question on linux-kernel@vger.kernel.org but maybe this
list would be a more appropriate place...

I'm currently reading and playing with the powernow-k8 cpufreq driver
module. However so far I wasn't able to find out how frequency transitions
are dealt with that have to be made using intermediate steps, ie.
transitions which cannot be done in one single step.

(I read about this at=20
http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/260=
94.PDF
p. 269f.)

I found safety guards which return an error if an invalid frequency
transition ("lo-lo transition") is requested. Is this the only support for
these transitions currently implemented or did I miss something?
Is there more advanced support simply missing, or is the current behaviour
sufficient, and if yes, why does this suffice?

How do the conservative/ondemand cpufreq governors cope with the kernel
advertising frequencies it cannot directly transition between?

I'd be really cool if someone could enlighten me, just some pointers at
powernow-k8.c functions I should take a closer look at might already
help. :-)

Greetings,

  Gunter

--=20
One of the universal rules of happiness is: always be wary of any=20
helpful item that weighs less than its operating manual.        --=20
(Terry Pratchett, Jingo)
*** PGP-Verschl=FCsselung bei eMails erw=FCnscht :-) *** PGP: 0x1128F25F ***
