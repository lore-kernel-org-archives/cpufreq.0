From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: Spam coming from the list
Date: Mon, 27 Sep 2004 21:50:23 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040927215023.D26680@flint.arm.linux.org.uk>
References: <b01d37a4040926074578038cd8@mail.gmail.com>
	<20040926162447.718973F03@latitude.mynet.no-ip.org>
	<20040926215157.A11082@flint.arm.linux.org.uk>
	<20040927203501.AD5E63F03@latitude.mynet.no-ip.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040927203501.AD5E63F03@latitude.mynet.no-ip.org>;
	from aeriksson@fastmail.fm on Mon, Sep 27, 2004 at 10:35:01PM
	+0200
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
To: aeriksson@fastmail.fm
Cc: cpufreq@www.linux.org.uk

On Mon, Sep 27, 2004 at 10:35:01PM +0200, aeriksson@fastmail.fm wrote:
> On Sun, 26 Sep 2004 21:51:57 BST Russell King wrote:
> >On Sun, Sep 26, 2004 at 06:24:46PM +0200, aeriksson@fastmail.fm wrote:
> >> I hate spam as much as the next guy, but filtering in at the mail list
> >> server it just not the Right Thing to do. It's an end2end problem and
> >> needs to have and end2end solution. All of us have private filers
> >> anyway, and we only run the risk of dropping legitimate mail.
> >
> >Disagree - peoples email systems actively reject spam, which causes
> >bounces.  The list interprets bounces as a failure of your address,
> >and with enough of them will disable and then unsubscribe you.
> >
> >Obviously bad news for the subscribers.
> >
> 
> Well that's pretty much the same man-in-the-middle attack on the feed
> as the maillist would do. My mail provider does that and I've asked
> them not to, but they refuse. They do it for all recipients on the
> smtp inlet, and  claim they have to send a bounce for leagal resons.
> Anyone know of a mailservice with a clean, untampered with, feed? (My 
> cable provider blocks 25).

This is off-topic for this list, and I guess interested parties should
continue in private mail... please?  If enough people want to discuss
this issue, I can setup an off-topic discussion list at www.linux.org.uk.
8)

There are three options to dealing with spam and viruses:
1. silently drop the message on the floor.
2. generate a bounce to the possibly forged return path address.
3. scan the messag at SMTP time and reject before accepting the
   message.

Any well behaved system uses solution (3) - chances are the incoming
SMTP connection is either directly from a virus or spam engine, in
which case rejecting the attempt does not create a bounce.

Obviously ISPs and companies certainly can not justify (1) as
acceptable behaviour on their part.  Maybe their setup doesn't allow
for (2), in which case they are just contributing to the spam and
virus problem.

Now, again, since this is an off-topic discussion for this list, can
we move it elsewhere please?

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
