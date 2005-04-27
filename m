From: "Ivor Hewitt" <ivor@ivor.org>
Subject: Re: Possible CPUFreq governor
Date: Wed, 27 Apr 2005 12:08:37 +0100 (BST)
Message-ID: <46736.141.228.156.225.1114600117.squirrel@www.difo.com>
References: <53866.130.127.49.120.1114558769.squirrel@130.127.49.120>
	<20050427105350.GX2298@poupinou.org>
Reply-To: ivor@ivor.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20050427105350.GX2298@poupinou.org>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@lists.linux.org.uk

> Hi,
>
> On Tue, Apr 26, 2005 at 07:39:29PM -0400, Mark Bidewell wrote:
>> I am attaching a Linux kernel patch which supplies a new CPUFreq governor
>> for the CPUFreq interface.  It allows a user or daemon to reduce the
>> thermal output of a mobile processor by reducing the frequency at which
>> non-interactive processes are run.  It has been extensively tested on the
>> 2.6.11.x kernels on a P4-M 3.2 GHz machine.
>
> BTW how temperature is computed?
>
I think the idea is to reduce cpuspeed, with the intention of having the side
effect of reducing temperature. Rather than to throttle based on temperature
(I may be wrong). I believe P4's will throttle themselves automatically when
they get too hot anyway.

Cheers,
Ivor.
