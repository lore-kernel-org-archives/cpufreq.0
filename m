From: Dave Jones <davej@redhat.com>
Subject: Re: [Patch] small cleanup for powernow-k7.c
Date: Thu, 20 Jan 2005 20:57:36 -0500
Message-ID: <20050121015736.GB32430@redhat.com>
References: <200501202138.35324.Hendrik.Muhs@web.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200501202138.35324.Hendrik.Muhs@web.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hendrik Muhs <Hendrik.Muhs@web.de>
Cc: cpufreq@ZenII.linux.org.uk

On Thu, Jan 20, 2005 at 09:38:35PM +0100, Hendrik Muhs wrote:
 > attached is a patch which fixes a wrong entry in the vid table and some 
 > comments.

Thanks, I've merged this, and will send Linus a request to pull again
soon so this should get into the next -rc release for 2.6.11.
I didn't merge the bit about CrystalCPUID because I'm not convinced
its true at all. I just double-checked the document I got from AMD
which clearly states it's "Reserved for 22.5x"
I don't know where the crystalcpuid folks got their numbers from, but
I'm sceptical. I'll check for an updated version of the powernow documentation,
but afaik, this is the last revision of this doc that was published.

 > A final question: 
 > 
 > Is something like this absolutly out of question for inclusion in mainline?
 > (yes I've read the archives and I have not found a final answer on this)
 > 
 > I see that this feature is not official supported by vendors and although I 
 > have implemented some mechanisms which should prevent serious CPU damage it 
 > can not (by design) completly safe (system may freeze on some setups).

I've slowly warmed to the *idea* of having some means for supporting
mobile chips in desktops, as it does seem to be happening more and more
for some reason. I didn't look at your last patch to be honest, so I can't
comment on whether its fit for merging before I take a look.

 > On the other side their is demand for this feature (not only for me). I do not 
 > know what to do with it in the future. If the door for inclusion in mainline 
 > is closed I would consider make some kind of source package and 
 > forking/renaming the driver so that it can be build independent from kernel.

Lets see what we can do to get it included.  Maintaining out of tree modules
is a real pain in the ass for all concerned, including end-users.
Rather than see endless support requests for 'why wont it build' on cpufreq-list
I'd rather we did what we could to get things like this included.

I'm holding off on 'feature' type things for 2.6.11 from now on, the next
round of cpufreq bits going to Linus should be only bug fixes, so hopefully
by 2.6.12 time, we can close the book on this one. This gives us enough
time to give it some exposure in Andrew's -mm tree too.

		Dave
