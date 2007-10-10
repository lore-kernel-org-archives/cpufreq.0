From: <Greg.Chandler@wellsfargo.com>
Subject: arm root filesystem.
Date: Wed, 10 Oct 2007 18:18:18 -0500
Message-ID: <1E7A4807A136DF45AD33DB341D93C3BD1F16B2@msgswbmnmsp46.wellsfargo.com>
References: <1E7A4807A136DF45AD33DB341D93C3BD1F0C19@msgswbmnmsp46.wellsfargo.com>
	<20070925073132.GA29127@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
content-class: urn:content-classes:message
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
To: cpufreq@lists.linux.org.uk, davej@redhat.com, dan.j.williams@intel.com



I was wondering if I could pick your brain with a couple of questions?
{any of you?}

I have an ipaq h3600, and I was able to put familiar on it just to make
sure it all worked.  What I am trying to do is build a base system that
I can use as an embedded controller for something else I'm building.

I have built a current kernel {with a cross-compiler} and it seems to
work.  {after submitting a patch {which really wasn't} to the kernel
list}

The kernel loads and has all it's output to both the serial or tty
consoles.  It uncompresses the ramdisk {initrd not initramfs} and it
recognizes it.
Booting the kernel from compact flash, it can see the partitions
correctly, and recognizes the devices correctly. I've played with the
params to give it invalid options to make sure it panics when the
options are wrong.

When the options are right, the last thing I see is "freeing init
memory: 132k".

Right after that it's supposed to have mounted read-only the ram disk
and be launching whatever init= is set to from the parameters.
If I eject the cf card it scrolls read/write errors, but I don't see it
actually doing anything...

I've also compiled in kernel-auto-conf options and NFS root as a 2nd
try.  If I switch the CF packpack with the PCMCIA one, while the kernel
is uncompressing /loading after it is read from the CF card, it will
detect the 3c589{or whatever it is} card.  I gave it all the appropriate
ip= root= and nfsroot options...  The IP is static so I don't have to
deal with DHCP/bootp/RARP.  I also had to force the PHY type to the
10baseT since it auto sets to 10base2.

Getting all that right, I can't ping the device {don't know if I should
be able to or not} and it scrolls RPC garbage until finally panicing
since it can't mount the NFS root. {I've set up hundreds of NFS root
boxes so I know the configs are all good}

No matter what I do, it seems to not like the root filesystem or not
like the init... I can't really tell which.....

I'm wondering if there is a memeory address problem.  I gave it both:
mem=16M and mem=32M even though the device has 64M, and that didn't
work.
I don't know if there is some offset that the FS needs to be loaded from
or if it MUST be jffs2, but familiar runs from and ext2...  {neither
ext2 or nfs seem to be working for me}

I've also read blurbs about similar issues {if not the same} were people
building with a cross-compiler aren't building correctly and have the
wrong binaries and such...  I'm pretty sure that I have all that right,
and that I have the right binary types {elf, a.out} compiled into the
kernel.


Any ideas?  I'm stuck...  Out of all the platforms I've worked on, I've
never gotten stuck before so this is a weird one for me.
