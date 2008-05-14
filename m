From: Jarod Wilson <jwilson@redhat.com>
Subject: Re: cpufreq question
Date: Wed, 14 May 2008 15:27:05 -0400
Message-ID: <200805141527.05614.jwilson@redhat.com>
References: <B6790881E7413D4092359CC9B3D8EEFD04EADAAE@dlee12.ent.ti.com>
	<6453C3CB8E2B3646B0D020C112613273093959@sausexmb4.amd.com>
	<B6790881E7413D4092359CC9B3D8EEFD04EADB27@dlee12.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <B6790881E7413D4092359CC9B3D8EEFD04EADB27@dlee12.ent.ti.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: "Frazier, John" <j-frazier2@ti.com>
Cc: cpufreq@lists.linux.org.uk

On Wednesday 14 May 2008 03:11:48 pm Frazier, John wrote:
[...]
> The version I am running is 1.2.1 and it works somewhat however I am
> having some issues with the dual core cpus not scaling correctly.

Does this ring a bell?

https://bugzilla.redhat.com/show_bug.cgi?id=392781

> That 
> is what led me down this path. I got a new version of cpuspeed from Carl
> Thomas and it does need the affected_cpus file which of course is not
> there.

What new version? 1.2.1 was released back in 2005, I don't see anything 
newer...

> Is there a way to just add the file? 

No. Its not actually a file. sysfs is a pseudo file system, which exposes 
assorted kernel interfaces, not something you can just add files to.


-- 
Jarod Wilson
jwilson@redhat.com
