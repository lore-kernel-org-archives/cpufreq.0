From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: cpufreq and 2.4.
Date: Mon, 18 Aug 2003 09:39:48 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030818073948.GC18032@poupinou.org>
References: <20030817153510.GA2361@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030817153510.GA2361@brodo.de>
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
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk

On Sun, Aug 17, 2003 at 05:35:10PM +0200, Dominik Brodowski wrote:
> (Again) some talk about the chances of cpufreq getting merged into 2.4. As
> previous cpufreq maintainer, and creator of several 2.4.-backports of
> cpufreq, here's some input on this matter, especially the problematic
> aspects:
> 
> A) Previous 2.4. cpufreq included in parts of kernel
> There _is_ already some cpufreq code in the 2.4. kernel. In arch/arm there
> are ARM-cpufreq drivers which use the previous 2.4. stable series of cpufreq
> which nobody uses on x86 any more [I guess]. In 2.6., the ARM cpufreq
> drivers are updated. However, this isn't included in the current 2.4. 
> backports.
> 
> B) Difficult-to-understand cpufreq user interfaces
> The /proc/cpufreq and /proc/sys/cpu interfaces are difficult to understand
> and already deprecated in 2.6. Do we really want them to be added to a
> stable kernel release?
> 
> C) No documentation for 2.4. cpufreq user interfaces
> As they're deprecated, I didn't explain them in the 2.6. kernel
> Documentation (Documentation/cpu-freq/user.txt). However, if it really
> should be documented well if it gets into the 2.4. stable series.
> 
> D) Who?
> Who is going to do C), and who will keep track of cpufreq-2.4.? 
> 

My poor english prevent me to do C) (but perhaps a kind soul with good
french knowledge and good english may assist me ?)
I can track cpufreq-2.4 if really needed.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
