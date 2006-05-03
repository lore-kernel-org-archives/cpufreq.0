From: "Van Alstine, Eric J" <eric.j.van.alstine@intel.com>
Subject: 2.6.9 cpufreq and scheduler interaction question on PXA27x processor
Date: Wed, 3 May 2006 13:51:40 -0700
Message-ID: <E02592704DB9854BB0B2E7DD3A633B776D2AF2@orsmsx412.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
To: cpufreq@lists.linux.org.uk

Hello, I'm new to messing around in the linux kernel and apologize if my
questions fall on the 'idiot' level, but would greatly appreciate any
assistance you could offer.  Here's the situation:

            Platform:  Intel PXA27x Xscale processor DVK=20

            OS:  2.6.9 kernel

            Issue:  I'm trying to play around with some ideas regarding
DVM/DFM.  Inside the scheduler, I'm trying to call pxa27x_set_cpufreq
which works its way through the CPUFreq interface, and am now getting a
"Unable to handle kernel NULL pointer dereference at virtual address
00000000".  I'm trying to dig through this and thought it was due to the
notify call, but after commenting that out, I get a similar but
differently located bug.  I'd appreciate anyone's thoughts as to what's
going on.  I was hoping to reuse the cpufreq functions, but if I can't
do that from inside the scheduler, I'll just write my own & reinvent the
wheel.

=20

Thanks for the help!

-Eric
