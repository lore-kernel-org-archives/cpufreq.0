From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: rebased cpufreq patch?
Date: 07 Jul 2003 20:38:32 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1057603112.11708.82.camel@gaston>
References: <20030707123448.GA1905@brodo.de>  <20030707193839.C9758@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030707193839.C9758@suse.de>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@suse.de>
Cc: Dominik Brodowski <linux@brodo.de>, anders@trudheim.com, cpufreq@www.linux.org.uk

On Mon, 2003-07-07 at 19:38, Dave Jones wrote:

> I've no objection really, but it does mean that we would be introducing
> an already obsolete interface into mainline. (~Not htat that's really a
> problem, we did already for 2.5 anyway).

I'd like to see the core in asap, if possible for .22, and I don't
care that much about the interface right now...

The point is that a bunch of recent Apple laptops boot at low speed
by default, and the only way I provide to switch them to full speed
is via cpufreq...  That's one of the few bits still preventing me
to fully merge my "powermac" kernels into mainline.

Ben.
